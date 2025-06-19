import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/domain/entities/base_entity.dart';

import '../../../commons/failure.dart';
import '../../../data/models/appinfo_model.dart';
import '../../../domain/usecase/appinfo_usecase.dart';

part 'appinfo_event.dart';
part 'appinfo_state.dart';

class AppinfoBloc extends Bloc<AppinfoEvent, AppinfoState> {
  final AppinfoUsecase appinfoUsecase;
  AppinfoBloc(this.appinfoUsecase) : super(AppinfoInitial()) {
    on<ReadAppInfoEvent>((event, emit) async {
      emit(AppinfoLoading());

      final result = await appinfoUsecase.readAppinfo(token: event.token, projectId: event.projectId);
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(AppinfoError(msgError: failure.message));
      }, (data) {
        emit(AppinfoSuccessRead(
          appInfoList: BaseResponseEntity(
            success: data.success,
            code: data.code,
            message: data.message,
            data: data.data,
          ),
        ));
      });
    });
    on<CreateAppInfoEvent>((event, emit) async {
      emit(AppinfoLoadingCreate());

      final result = await appinfoUsecase.create(
        token: event.token,
        projectId: event.projectId,
        name: event.name,
        version: event.version,
        telegram: event.telegram,
        whatsapp: event.whatsapp,
        email: event.email,
        thumbnail: event.thumbnail,
      );
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(AppinfoErrorCreate(msgError: failure.message));
      }, (data) {
        emit(AppInfoSuccessCreate(
          appInfo: data,
        ));
      });
    });
    on<DeleteAppinfoEvent>((event, emit) async {
      emit(AppinfoLoadingDelete());

      final result = await appinfoUsecase.delete(
        token: event.token,
        appinfoId: event.appinfoId,
        projectId: event.projectId,
      );
      result.fold((failure) {
        if (failure is TokenExpiredException) {
          emit(TokenExpiredState(failure.message));
        }
        emit(AppinfoErrorDelete(msgError: failure.message));
      }, (data) {
        emit(AppInfoSuccessDelete(
          appInfo: data,
        ));
      });
    });
  }
}
