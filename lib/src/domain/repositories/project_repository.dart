import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/project_model.dart';
import 'package:panel_apk/src/domain/entities/base_entity.dart';

import '../../commons/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, BaseResponseEntity<List<ProjectModel>>>> readProject(String token);
  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> createProject({
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  });
  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> deleteProject({
    required String token,
    required String idProject,
  });
  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> updateProject({
    required String idProject,
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  });
}
