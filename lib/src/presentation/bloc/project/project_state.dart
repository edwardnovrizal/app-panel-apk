part of 'project_bloc.dart';

sealed class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

final class ProjectInitial extends ProjectState {}

final class ProjectLoading extends ProjectState {}

final class ProjectLoaded extends ProjectState {
  final BaseResponseEntity<List<ProjectModel>> projects;

  const ProjectLoaded(this.projects);
}

final class ProjectError extends ProjectState {
  final String msgError;

  const ProjectError(this.msgError);
}

final class CreateProjectLoading extends ProjectState {}

final class CreateProjectLoaded extends ProjectState {
  final BaseResponseEntity<ProjectModel> projects;

  const CreateProjectLoaded(this.projects);
}

final class CreateProjectError extends ProjectState {
  final String msgError;

  const CreateProjectError(this.msgError);
}

class TokenExpiredState extends ProjectState {
  final String message;

  const TokenExpiredState(this.message);
}

final class DeleteProjectLoading extends ProjectState {}

final class DeleteProjectLoaded extends ProjectState {
  final BaseResponseEntity<ProjectModel> projects;

  const DeleteProjectLoaded(this.projects);
}

final class DeleteProjectError extends ProjectState {
  final String msgError;

  const DeleteProjectError(this.msgError);
}

final class UpdateProjectLoading extends ProjectState {}

final class UpdateProjectLoaded extends ProjectState {
  final BaseResponseEntity<ProjectModel> projects;

  const UpdateProjectLoaded(this.projects);
}

final class UpdateProjectError extends ProjectState {
  final String msgError;

  const UpdateProjectError(this.msgError);
}
