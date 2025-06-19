part of 'appinfo_bloc.dart';

sealed class AppinfoState extends Equatable {
  const AppinfoState();

  @override
  List<Object> get props => [];
}

final class AppinfoInitial extends AppinfoState {}

class TokenExpiredState extends AppinfoState {
  final String message;

  const TokenExpiredState(this.message);
}

final class AppinfoLoading extends AppinfoState {}

final class AppinfoLoadingCreate extends AppinfoState {}

final class AppinfoLoadingDelete extends AppinfoState {}

final class AppinfoError extends AppinfoState {
  final String msgError;
  const AppinfoError({required this.msgError});

  @override
  List<Object> get props => [msgError];
}

final class AppinfoErrorCreate extends AppinfoState {
  final String msgError;
  const AppinfoErrorCreate({required this.msgError});

  @override
  List<Object> get props => [msgError];
}

final class AppinfoErrorDelete extends AppinfoState {
  final String msgError;
  const AppinfoErrorDelete({required this.msgError});

  @override
  List<Object> get props => [msgError];
}

final class AppinfoSuccessRead extends AppinfoState {
  final BaseResponseEntity<List<AppInfoModel>> appInfoList;
  const AppinfoSuccessRead({required this.appInfoList});

  @override
  List<Object> get props => [appInfoList];
}

final class AppInfoSuccessCreate extends AppinfoState {
  final BaseResponseEntity<AppInfoModel> appInfo;
  const AppInfoSuccessCreate({required this.appInfo});

  @override
  List<Object> get props => [appInfo];
}

final class AppInfoSuccessDelete extends AppinfoState {
  final BaseResponseEntity<AppInfoModel> appInfo;
  const AppInfoSuccessDelete({required this.appInfo});

  @override
  List<Object> get props => [appInfo];
}
