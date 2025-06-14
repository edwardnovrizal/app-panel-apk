part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class LoadProject extends ProjectEvent {
  final String token;

  const LoadProject(this.token);
}

class CreateProject extends ProjectEvent {
  final String token;
  final String name;
  final String packageName;
  final String godevName;
  final XFile? logo;

  const CreateProject({
    required this.token,
    required this.name,
    required this.packageName,
    required this.godevName,
    this.logo,
  });
}

class DeleteProject extends ProjectEvent {
  final String token;
  final String idProject;

  const DeleteProject({
    required this.token,
    required this.idProject,
  });
}

class UpdateProject extends ProjectEvent {
  final String idProject;
  final String token;
  final String name;
  final String packageName;
  final String godevName;
  final XFile? logo;

  const UpdateProject({
    required this.idProject,
    required this.token,
    required this.name,
    required this.packageName,
    required this.godevName,
    this.logo,
  });
}
