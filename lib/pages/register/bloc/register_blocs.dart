import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_fblock/pages/register/bloc/register_events.dart';
import 'package:shop_fblock/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>((event, emit) {
      // print('Name - ${event.userName}');
      emit(state.copyWith(userName: event.userName));
    });

    on<EmailEvent>((event, emit) {
      // print('Email - ${event.email}');
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      // print('Pass- ${event.password}');
      emit(state.copyWith(password: event.password));
    });

    on<RePasswordEvent>((event, emit) {
      // print('Repas- ${event.rePassword}');
      emit(state.copyWith(rePassword: event.rePassword));
    });
  }
}
