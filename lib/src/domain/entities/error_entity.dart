import 'package:equatable/equatable.dart';
import 'package:panel_apk/src/data/models/error_model.dart';

class ErrorResponeEntity extends Equatable {
  final bool success;
  final int code;
  final String message;
  final List<ErrorModel> errors;

  const ErrorResponeEntity({
    required this.success,
    required this.code,
    required this.message,
    required this.errors,
  });

  @override
  List<Object?> get props => [success, code, message, errors];
}
