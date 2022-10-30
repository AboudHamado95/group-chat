import 'package:chat_group/features/chat/domain/entities/user_entity.dart';

abstract class FireBaseRepository {
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
