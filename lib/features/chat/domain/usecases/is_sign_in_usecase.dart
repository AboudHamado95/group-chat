import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class IsSignInUseCase extends UseCase<bool, NoParams> {
  final FireBaseRepository repository;
  IsSignInUseCase({required this.repository});

  @override
  Future<bool> call(NoParams params) {
    return repository.isSignIn();
  }
}
