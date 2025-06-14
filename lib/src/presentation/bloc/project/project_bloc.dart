import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/data/models/project_model.dart';
import 'package:panel_apk/src/domain/usecase/project_usecase.dart';

import '../../../commons/failure.dart';
import '../../../domain/entities/base_entity.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectUsecase projectUsecase;
  ProjectBloc(this.projectUsecase) : super(ProjectInitial()) {
    on<LoadProject>((event, emit) async {
      emit(ProjectLoading());

      final result = await projectUsecase.readProject(event.token);
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(ProjectError(failure.message));
      }, (data) {
        emit(ProjectLoaded(
          BaseResponseEntity(
            success: data.success,
            code: data.code,
            message: data.message,
            data: data.data,
          ),
        ));
      });
    });
    on<CreateProject>((event, emit) async {
      emit(CreateProjectLoading());

      final result = await projectUsecase.createProject(
        token: event.token,
        name: event.name,
        packageName: event.packageName,
        godevName: event.godevName,
        logo: event.logo,
      );
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(CreateProjectError(failure.message));
      }, (data) {
        emit(CreateProjectLoaded(data));
      });
    });
    on<DeleteProject>((event, emit) async {
      emit(DeleteProjectLoading());

      final result = await projectUsecase.deleteProject(
        token: event.token,
        idProject: event.idProject,
      );
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(DeleteProjectError(failure.message));
      }, (data) {
        emit(DeleteProjectLoaded(data));
      });
    });
    on<UpdateProject>((event, emit) async {
      emit(UpdateProjectLoading());

      final result = await projectUsecase.updateProject(
        idProject: event.idProject,
        token: event.token,
        name: event.name,
        packageName: event.packageName,
        godevName: event.godevName,
        logo: event.logo,
      );
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(UpdateProjectError(failure.message));
      }, (data) {
        emit(UpdateProjectLoaded(data));
      });
    });
  }
}
