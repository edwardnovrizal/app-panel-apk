import 'package:equatable/equatable.dart';

class RegisterResponeEntity extends Equatable {
  final bool success;
  final int code;
  final String message;

  const RegisterResponeEntity({
    required this.success,
    required this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [success, code, message];
}
