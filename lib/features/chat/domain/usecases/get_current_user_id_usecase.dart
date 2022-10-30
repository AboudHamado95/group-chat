import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase extends UseCase<String, NoParams> {
  final FireBaseRepository repository;
  GetCurrentUserIdUseCase({required this.repository});

  @override
  Future<String> call(NoParams params) async {
    return repository.getCurrentUserId();
  }
}
