import 'package:equatable/equatable.dart';

class LoginResponeEntity extends Equatable {
  final bool success;
  final int code;
  final String message;
  final String data;

  const LoginResponeEntity({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, code, message, data];
}
