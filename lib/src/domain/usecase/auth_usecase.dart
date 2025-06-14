import 'package:dartz/dartz.dart';
import 'package:panel_apk/src/domain/entities/login_entity.dart';
import 'package:panel_apk/src/domain/entities/register_entity.dart';
import 'package:panel_apk/src/domain/repositories/auth_repository.dart';

import '../../commons/failure.dart';

class AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecase(this.authRepository);

  Future<Either<Failure, RegisterResponeEntity>> register(
      String username, String email, String fullname, String password) async {
    return authRepository.register(username, email, fullname, password);
  }

  Future<Either<Failure, LoginResponeEntity>> login(String username, String password) async {
    return authRepository.login(username, password);
  }
}
