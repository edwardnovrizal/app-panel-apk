import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panel_apk/src/domain/entities/register_entity.dart';

import '../../../domain/usecase/auth_usecase.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthUsecase authUsecase;
  RegisterBloc(this.authUsecase) : super(RegisterInitial()) {
    on<LoadRegister>((event, emit) async {
      emit(RegisterLoading());

      final result = await authUsecase.register(event.username, event.email, event.fullname, event.password);
      result.fold((l) => emit(RegisterFailed(l.message)), (r) => emit(RegisterSuccess(r)));
    });
  }
}
