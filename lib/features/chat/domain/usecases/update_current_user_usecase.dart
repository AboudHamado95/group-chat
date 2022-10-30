import 'package:chat_group/core/errors/failures.dart';
import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateCurrentUserUseCase extends UseCase<void, UserEntity> {
  final FireBaseRepository repository;
  UpdateCurrentUserUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.getUpdateUser(params);
  }
}
