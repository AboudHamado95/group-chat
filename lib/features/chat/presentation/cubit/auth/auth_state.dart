part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final String uId;

  const AuthenticatedState({required this.uId});
  @override
  List<Object> get props => [uId];
}

class UnAuthenticatedState extends AuthState {
  final String error;

  const UnAuthenticatedState({required this.error});
  @override
  List<Object> get props => [error];
}
