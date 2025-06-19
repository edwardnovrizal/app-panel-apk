import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/commons/failure.dart';
import 'package:panel_apk/src/data/models/appinfo_model.dart';
import 'package:panel_apk/src/domain/entities/base_entity.dart';
import 'package:panel_apk/src/domain/repositories/appinfo_repository.dart';

import '../../commons/exeption.dart';
import '../sources/remote/appinfo_datasource.dart';

class AppinfoRepositoryImpl extends AppinfoRepository {
  final AppinfoDatasource appinfoDatasource;
  AppinfoRepositoryImpl({required this.appinfoDatasource});

  @override
  Future<Either<Failure, BaseResponseEntity<List<AppInfoModel>>>> readAppinfo(
      {required String token, required String projectId}) async {
    try {
      final result = await appinfoDatasource.readAppInfo(token: token, projectId: projectId);

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
  Future<Either<Failure, BaseResponseEntity<AppInfoModel>>> create(
      {required String? token,
      required String? projectId,
      String? name,
      String? version,
      String? telegram,
      String? whatsapp,
      String? email,
      XFile? thumbnail}) async {
    try {
      final result = await appinfoDatasource.create(
        token: token,
        projectId: projectId,
        name: name,
        version: version,
        telegram: telegram,
        whatsapp: whatsapp,
        email: email,
        thumbnail: thumbnail,
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
  Future<Either<Failure, BaseResponseEntity<AppInfoModel>>> delete(
      {required String token, required String appinfoId, required String projectId}) async {
    try {
      final result = await appinfoDatasource.delete(token: token, projectId: projectId, appinfoId: appinfoId);

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
