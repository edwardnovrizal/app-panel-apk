import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/project_model.dart';
import 'package:panel_apk/src/domain/repositories/project_repository.dart';

import '../../commons/failure.dart';
import '../entities/base_entity.dart';

class ProjectUsecase {
  final ProjectRepository projecRepository;

  ProjectUsecase(this.projecRepository);

  Future<Either<Failure, BaseResponseEntity<List<ProjectModel>>>> readProject(String token) async {
    return projecRepository.readProject(token);
  }

  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> createProject({
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  }) async {
    return projecRepository.createProject(
      token: token,
      name: name,
      packageName: packageName,
      godevName: godevName,
      logo: logo,
    );
  }

  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> deleteProject({
    required String token,
    required String idProject,
  }) async {
    return projecRepository.deleteProject(token: token, idProject: idProject);
  }

  Future<Either<Failure, BaseResponseEntity<ProjectModel>>> updateProject({
    required String idProject,
    required String token,
    required String name,
    required String packageName,
    required String godevName,
    XFile? logo,
  }) async {
    return projecRepository.updateProject(
      idProject: idProject,
      token: token,
      name: name,
      packageName: packageName,
      godevName: godevName,
      logo: logo,
    );
  }
}
