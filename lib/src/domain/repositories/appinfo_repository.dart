import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/appinfo_model.dart';

import '../../commons/failure.dart';
import '../entities/base_entity.dart';

abstract class AppinfoRepository {
  Future<Either<Failure, BaseResponseEntity<List<AppInfoModel>>>> readAppinfo({
    required String token,
    required String projectId,
  });
  Future<Either<Failure, BaseResponseEntity<AppInfoModel>>> create({
    required String? token,
    required String? projectId,
    String? name,
    String? version,
    String? telegram,
    String? whatsapp,
    String? email,
    XFile? thumbnail,
  });
  Future<Either<Failure, BaseResponseEntity<AppInfoModel>>> delete({
    required String token,
    required String appinfoId,
    required String projectId,
  });
}
