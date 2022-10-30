import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class ForgotPasswordUseCase extends UseCase<void, String> {
  final FireBaseRepository repository;
  ForgotPasswordUseCase({required this.repository});

  @override
  Future<void> call(String params) {
    return repository.forgotPassword(params);
  }
}
