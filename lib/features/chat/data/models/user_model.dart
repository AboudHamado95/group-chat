import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel(
      {super.uId,
      super.name,
      super.email,
      super.phoneNumber,
      super.isOnline,
      super.status,
      super.profileUrl,
      super.password,
      super.date,
      super.gender});
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      uId: snapshot.get('uId'),
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phoneNumber: snapshot.get('phoneNumber'),
      isOnline: snapshot.get('isOnline'),
      status: snapshot.get('status'),
      profileUrl: snapshot.get('profileUrl'),
      password: snapshot.get('password'),
      date: snapshot.get('date'),
      gender: snapshot.get('gender'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'gender': gender,
      'isOnline': isOnline,
      'date': date,
      'phoneNumber': phoneNumber,
      'profileUrl': profileUrl,
      'status': status,
    };
  }
}
