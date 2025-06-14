part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadRegister extends RegisterEvent {
  final String username;
  final String email;
  final String fullname;
  final String password;

  const LoadRegister({required this.username, required this.email, required this.fullname, required this.password});
}
