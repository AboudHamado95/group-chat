import 'package:chat_group/features/chat/data/datasources/firebase_remote_date_source.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class FireBaseRepositoryImpl extends FireBaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FireBaseRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> createUser(UserEntity user) async {
    return remoteDataSource.createUser(user);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await remoteDataSource.forgotPassword(email);
  }

  @override
  Future<String> getCurrentUserId() async {
    return remoteDataSource.getCurrentUserId();
  }

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    return remoteDataSource.getUpdateUser(user);
  }

  @override
  Future<void> googleAuth() async {
    return remoteDataSource.googleAuth();
  }

  @override
  Future<bool> isSignIn() async {
    return remoteDataSource.isSignIn();
  }

  @override
  Future<void> signIn(UserEntity user) async {
    return remoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    return remoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    return remoteDataSource.signUp(user);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    return remoteDataSource.getAllUsers();
  }
}
