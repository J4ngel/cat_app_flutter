import 'package:cat_app_flutter/core/di/dependency_injection.dart';
import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/organism/login_organism.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<LoginBloc>(), // GetIt.instance.get<LoginBloc>(),
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return BlocListener<LoginBloc, LoginState>(
        listener: _listener,
        child: Scaffold(
            body: Column(
          children: [
            const Icon(Icons.abc, size: 80),
            LoginOrganism(
              onChangeEmail: (value) {
                final event = ChangeEmailEvent(newEmail: value);
                bloc.add(event);
              },
              onChangePassword: (value) {
                final event = ChangePasswordEvent(newPassword: value);
                bloc.add(event);
              },
              emailValidator: (_) {
                return bloc.state.data.emailError;
              },
              passwordValidator: (_) {
                return bloc.state.data.passwordError;
              },
              onPressLogin: () {
                final result = bloc.state.data.isValid;
                if (result) {
                  final event = SuccessEvent();

                  bloc.add(event);
                }
              },
            ),
            const Text('Registrarse')
          ],
        )));
  }

  void _listener(BuildContext context, state) {
    if (state is DataLoginUpdated) {
      debugPrint(state.data.email.getOrNull());
      debugPrint(state.data.password.getOrNull());
    }
  }
}
