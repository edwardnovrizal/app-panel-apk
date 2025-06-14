import 'package:dartz/dartz.dart';
import 'package:panel_apk/src/data/models/register_model.dart';
import 'package:panel_apk/src/data/sources/remote/auth_datasource.dart';
import 'package:panel_apk/src/domain/entities/login_entity.dart';
import 'package:panel_apk/src/domain/repositories/auth_repository.dart';

import '../../commons/exeption.dart';
import '../../commons/failure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failure, RegisterResponeModel>> register(
      String username, String email, String fullname, String password) async {
    try {
      final result = await authRemoteDatasource.register(username, email, fullname, password);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      return Left(ServerFailure('Server Not Respone : $e'));
    }
  }

  @override
  Future<Either<Failure, LoginResponeEntity>> login(String username, String password) async {
    try {
      final result = await authRemoteDatasource.login(username, password);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
  }
}
