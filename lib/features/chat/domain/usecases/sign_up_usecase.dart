import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class SignUpUseCase extends UseCase<void, UserEntity> {
  final FireBaseRepository repository;
  SignUpUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.signUp(params);
  }
}
