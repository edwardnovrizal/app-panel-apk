part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoadLogin extends LoginEvent {
  final String username;
  final String password;
  const LoadLogin({
    required this.username,
    required this.password,
  });
}
