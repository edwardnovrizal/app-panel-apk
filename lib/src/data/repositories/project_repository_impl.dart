import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/base_model.dart';
import 'package:panel_apk/src/data/models/project_model.dart';
import 'package:panel_apk/src/data/sources/remote/project_datasource.dart';
import 'package:panel_apk/src/domain/entities/base_entity.dart';
import 'package:panel_apk/src/domain/repositories/project_repository.dart';

import '../../commons/exeption.dart';
import '../../commons/failure.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectRemoteDatasource projectRemoteDatasource;

  ProjectRepositoryImpl({required this.projectRemoteDatasource});

  @override
  Future<Either<Failure, BaseResponseModel<List<ProjectModel>>>> readProject(String token) async {
    try {
      final result = await projectRemoteDatasource.readProject(token);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      if (e is TokenExpiredException) {
        return Left(e);
      }
      return Left(ServerFailure('Server Not Respone : $e'));
    }
  }

  @override
  Future<Either<Failure, BaseResponseModel<ProjectModel>>> createProject({
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  }) async {
    try {
      final result = await projectRemoteDatasource.createProject(
        token: token,
        name: name,
        packageName: packageName,
        godevName: godevName,
        logo: logo,
      );

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      if (e is TokenExpiredException) {
        return Left(e);
      }
      return Left(ServerFailure('Server Not Respone : $e'));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> deleteProject(
      {required String token, required String idProject}) async {
    try {
      final result = await projectRemoteDatasource.deleteProject(
        token: token,
        idProject: idProject,
      );

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      if (e is TokenExpiredException) {
        return Left(e);
      }
      return Left(ServerFailure('Server Not Respone : $e'));
    }
  }

  @override
  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> updateProject(
      {required String idProject,
      required String token,
      required String name,
      required String packageName,
      required String godevName,
      XFile? logo}) async {
    try {
      final result = await projectRemoteDatasource.updateProject(
        idProject: idProject,
        token: token,
        name: name,
        packageName: packageName,
        godevName: godevName,
        logo: logo,
      );

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      if (e is TokenExpiredException) {
        return Left(e);
      }
      return Left(ServerFailure('Server Not Respone : $e'));
    }
  }
}
