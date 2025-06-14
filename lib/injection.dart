import 'package:get_it/get_it.dart';
import 'package:panel_apk/src/domain/repositories/project_repository.dart';
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

final locator = GetIt.instance;

void init() {
  // bloc

  locator.registerFactory(() => RegisterBloc(locator()));
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => ProjectBloc(locator()));

  // usecases
  locator.registerLazySingleton(() => AuthUsecase(locator()));
  locator.registerLazySingleton(() => ProjectUsecase(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDatasource: locator()),
  );
  locator.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(projectRemoteDatasource: locator()),
  );

  // sources
  locator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  locator.registerLazySingleton<ProjectRemoteDatasource>(
    () => ProjectRemoteDatasourceImpl(),
  );
}
