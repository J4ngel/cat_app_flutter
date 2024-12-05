import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/organism/login_organism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<LoginBloc>(),
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();



  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginBloc, LoginState>(
      listener: _listener,
      child: Scaffold(
        body: Column(
          children: [
            const Icon(Icons.abc, size: 80),
            LoginOrganism(
              onChangeEmail: (value){
                final event = ChangeEmailEvent(newEmail: value);
                context.read<LoginBloc>().add(event);
              },
              onChangePassword: (value){
                final event = ChangePasswordEvent(newPassword: value);
                context.read<LoginBloc>().add(event);
              },
              emailValidator: (_){
                return context.read<LoginBloc>().state.data.emailError;
              },
              passwordValidator: (_){
                return context.read<LoginBloc>().state.data.passwordError;
              },
              onPressLogin: (){

              },
            ),
            const Text('Registrarse')
          ],
        )
      )
    );
  }

  void _listener(BuildContext context, state) {
    if(state is DataLoginUpdated){
      debugPrint(state.data.email.getOrNull());
      debugPrint(state.data.password.getOrNull());
    }
  }
}

