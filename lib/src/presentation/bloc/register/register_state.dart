part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponeEntity registerResponeEntity;
  const RegisterSuccess(this.registerResponeEntity);
}

class RegisterFailed extends RegisterState {
  final String msgError;
  const RegisterFailed(this.msgError);
}
