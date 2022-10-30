import 'package:chat_group/features/chat/data/datasources/firebase_remote_date_source.dart';
import 'package:chat_group/features/chat/data/repositories/firebase_repository_impl.dart';
import 'package:chat_group/features/chat/domain/repositories/firebase_repository.dart';
import 'package:chat_group/features/chat/domain/usecases/create_user_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/forgot_password_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/get_current_user_id_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/google_auth_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/is_sign_in_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/sign_in_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/sign_out_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/sign_up_usecase.dart';
import 'package:chat_group/features/chat/presentation/cubit/auth/auth_cubit.dart';
import 'package:chat_group/features/chat/presentation/cubit/credential/credential_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl(),
      getCurrentUserIdUseCase: sl(),
      signOutUseCase: sl()));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      forgotPasswordUseCase: sl(),
      createUserUseCase: sl(),
      googleAuthUseCase: sl()));

  //useCases
  //authCubit useCases
  sl.registerLazySingleton<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase(repository: sl()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl()));

  //credentialCubit useCases
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl()));
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl()));
  sl.registerLazySingleton<CreateUserUseCase>(
      () => CreateUserUseCase(repository: sl()));
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(repository: sl()));

  //repository
  sl.registerLazySingleton<FireBaseRepository>(
      () => FireBaseRepositoryImpl(remoteDataSource: sl()));

  //remote dataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(
          auth: sl(), firestore: sl(), googleSignIn: sl()));
  //local dataSource

  //external
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => googleSignIn);
}
