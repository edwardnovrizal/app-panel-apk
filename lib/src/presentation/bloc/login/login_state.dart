part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponeEntity login;

  const LoginSuccess(this.login);
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);
}
