import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class SignInUseCase extends UseCase<void, UserEntity> {
  final FireBaseRepository repository;
  SignInUseCase({required this.repository});

  @override
  Future<void> call(UserEntity params) {
    return repository.signIn(params);
  }
}
