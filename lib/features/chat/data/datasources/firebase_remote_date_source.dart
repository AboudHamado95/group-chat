import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:chat_group/features/chat/data/models/user_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> forgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateUser(UserEntity user);
  Future<String> getCurrentUserId();
  Future<void> createUser(UserEntity user);
  Stream<List<UserEntity>> getAllUsers();
}

class FirebaseRemoteDataSourceImpl extends FirebaseRemoteDataSource {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  GoogleSignIn googleSignIn;
  FirebaseRemoteDataSourceImpl(
      {required this.auth,
      required this.firestore,
      required this.googleSignIn});
  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firestore.collection('users');
    final uId = await getCurrentUserId();

    userCollection.doc(uId).get().then((userDoc) {
      final newUser = UserModel(
              uId: user.uId,
              name: user.name,
              email: user.email,
              phoneNumber: user.phoneNumber,
              password: user.password,
              gender: user.gender,
              profileUrl: user.profileUrl,
              status: user.status,
              isOnline: user.isOnline,
              date: user.date)
          .toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uId).set(newUser);
      }
      return;
    });
  }

  @override
  Future<void> forgotPassword(String email) async {
    return auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> getCurrentUserId() async {
    return auth.currentUser!.uid;
  }

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    Map<String, dynamic> userInformation = {};
    final userCollection = firestore.collection('users');

    if (user.profileUrl != null && user.profileUrl != '') {
      userInformation['profileUrl'] = user.profileUrl;
    }
    if (user.name != null && user.name != '') {
      userInformation['name'] = user.name;
    }
    if (user.status != null && user.status != '') {
      userInformation['status'] = user.status;
    }

    userCollection.doc(user.uId).update(userInformation);
  }

  @override
  Future<void> googleAuth() async {
    GoogleSignInAccount? account = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await account!.authentication;

    final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final userInforamation =
        (await auth.signInWithCredential(authCredential)).user;
    createUser(UserEntity(
      name: userInforamation!.displayName,
      email: userInforamation.email,
      gender: '',
      date: '',
      phoneNumber: userInforamation.phoneNumber,
      profileUrl: userInforamation.photoURL,
      status: '',
      isOnline: false,
    ));
  }

  @override
  Future<bool> isSignIn() async {
    return auth.currentUser?.uid != null;
  }

  @override
  Future signIn(UserEntity user) async {
    return await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut() async {
    return auth.signOut();
  }

  @override
  Future signUp(UserEntity user) async {
    return auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection('users');

    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }
}
