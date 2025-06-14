import 'package:dartz/dartz.dart';
import 'package:panel_apk/src/domain/entities/login_entity.dart';
import 'package:panel_apk/src/domain/entities/register_entity.dart';

import '../../commons/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponeEntity>> register(
      String username, String email, String fullname, String password);
  Future<Either<Failure, LoginResponeEntity>> login(String username, String password);
}
