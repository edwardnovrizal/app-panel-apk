import 'package:equatable/equatable.dart';

class BaseResponseEntity<T> extends Equatable {
  final bool success;
  final int code;
  final String message;
  final T data;

  const BaseResponseEntity({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, code, message, data];
}
