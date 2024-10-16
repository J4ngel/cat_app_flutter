import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc(): super(const InitialState()){
    on<LoginUserEvent>(_onLoginUserEvent);
  }


  FutureOr<void> _onLoginUserEvent(LoginUserEvent event, Emitter<WelcomeState> emit) {
    emit(const AuthenticationSuccessState());
  }
}