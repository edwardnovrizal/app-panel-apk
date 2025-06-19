import 'package:get_it/get_it.dart';
import 'package:panel_apk/src/data/repositories/appinfo_repository_impl.dart';
import 'package:panel_apk/src/data/sources/remote/appinfo_datasource.dart';
import 'package:panel_apk/src/domain/repositories/appinfo_repository.dart';
import 'package:panel_apk/src/domain/repositories/project_repository.dart';
import 'package:panel_apk/src/domain/usecase/appinfo_usecase.dart';
import 'package:panel_apk/src/domain/usecase/auth_usecase.dart';
import 'package:panel_apk/src/domain/usecase/project_usecase.dart';
import 'package:panel_apk/src/presentation/bloc/login/login_bloc.dart';
import 'package:panel_apk/src/presentation/bloc/project/project_bloc.dart';
import 'package:panel_apk/src/presentation/bloc/register/register_bloc.dart';

import 'src/data/repositories/auth_repository_impl.dart';
import 'src/data/repositories/project_repository_impl.dart';
import 'src/data/sources/remote/auth_datasource.dart';
import 'src/data/sources/remote/project_datasource.dart';
import 'src/domain/repositories/auth_repository.dart';
import 'src/presentation/bloc/appinfo/appinfo_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc

  locator.registerFactory(() => RegisterBloc(locator()));
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => ProjectBloc(locator()));
  locator.registerFactory(() => AppinfoBloc(locator()));

  // usecases
  locator.registerLazySingleton(() => AuthUsecase(locator()));
  locator.registerLazySingleton(() => ProjectUsecase(locator()));
  locator.registerLazySingleton(() => AppinfoUsecase(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDatasource: locator()),
  );
  locator.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(projectRemoteDatasource: locator()),
  );
  locator.registerLazySingleton<AppinfoRepository>(
    () => AppinfoRepositoryImpl(appinfoDatasource: locator()),
  );

  // sources
  locator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  locator.registerLazySingleton<ProjectRemoteDatasource>(
    () => ProjectRemoteDatasourceImpl(),
  );
  locator.registerLazySingleton<AppinfoDatasource>(
    () => AppinfoDatasourceImpl(),
  );
}
