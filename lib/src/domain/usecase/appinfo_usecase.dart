import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/appinfo_model.dart';
import 'package:panel_apk/src/domain/repositories/appinfo_repository.dart';

import '../../commons/failure.dart';
import '../entities/base_entity.dart';

class AppinfoUsecase {
  final AppinfoRepository appinfoRepository;

  AppinfoUsecase(this.appinfoRepository);

  Future<Either<Failure, BaseResponseEntity<List<AppInfoModel>>>> readAppinfo(
      {required String token, required String projectId}) async {
    return appinfoRepository.readAppinfo(token: token, projectId: projectId);
  }

  Future<Either<Failure, BaseResponseEntity<AppInfoModel>>> create({
    required String token,
    required String projectId,
    String? name,
    String? version,
    String? telegram,
    String? whatsapp,
    String? email,
    XFile? thumbnail,
  }) async {
    return appinfoRepository.create(
      token: token,
      projectId: projectId,
      name: name,
      version: version,
      telegram: telegram,
      whatsapp: whatsapp,
      email: email,
      thumbnail: thumbnail,
    );
  }

  Future<Either<Failure, BaseResponseEntity<AppInfoModel>>> delete(
      {required String token, required String appinfoId, required String projectId}) async {
    return appinfoRepository.delete(token: token, appinfoId: appinfoId, projectId: projectId);
  }
}
