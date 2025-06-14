import 'package:equatable/equatable.dart';
import 'package:panel_apk/src/data/models/error_model.dart';

class Failure extends Equatable {
  final String message;
  final ErrorResponeModel? error;

  const Failure(this.message, {this.error});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class TokenExpiredException extends Failure {
  const TokenExpiredException(super.message);
}
