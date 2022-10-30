import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class GetAllUsersUseCases {
  final FireBaseRepository repository;
  GetAllUsersUseCases({required this.repository});

  Stream<List<UserEntity>> call(NoParams params) {
    return repository.getAllUsers();
  }
}