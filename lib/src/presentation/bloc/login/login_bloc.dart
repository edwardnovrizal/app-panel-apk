import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panel_apk/src/domain/entities/login_entity.dart';
import 'package:panel_apk/src/domain/usecase/auth_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUsecase authUsecase;
  LoginBloc(this.authUsecase) : super(LoginInitial()) {
    on<LoadLogin>((event, emit) async {
      emit(LoginLoading());

      final result = await authUsecase.login(event.username, event.password);
      result.fold(
        (failure) => emit(LoginError(failure.message)),
        (result) => emit(LoginSuccess(result)),
      );
    });
  }
}
