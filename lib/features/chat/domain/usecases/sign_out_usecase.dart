import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class SignOutUseCase extends UseCase<void, NoParams> {
  final FireBaseRepository repository;
  SignOutUseCase({required this.repository});

  @override
  Future<void> call(NoParams params) {
    return repository.signOut();
  }
}
