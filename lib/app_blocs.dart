import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_fblock/app_events.dart';
import 'package:shop_fblock/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, emit) {
      print(' ++ ${state.counter}');
      emit(AppStates(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) => emit(AppStates(counter: state.counter - 1)));
  }
}