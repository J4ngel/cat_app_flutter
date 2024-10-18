import 'package:cat_app_flutter/features/authentication/application/bloc/welcome/welcome_bloc.dart';
import 'package:cat_app_flutter/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/data_sources/implementations/remote/user_remote_data_source_Impl.dart';
import 'package:cat_app_flutter/features/authentication/infrastructure/gateways/user_gateway.dart';
import 'package:cat_app_flutter/features/authentication/utils/constants/authentications_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<WelcomeBloc>(),
      child: const Scaffold(
        body: _View(),
      ),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  Color? colorButton;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: _listener,
      child: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: colorButton),
            onPressed: () {
              context.read<WelcomeBloc>().add(const GetUserEvent(
                  email: 'jaime@correo.co', phone: '3041234564'));
            },
            child: Text(AuthenticationStrings.I.login)),
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is AuthenticationSuccessState) {
      print("Cambió estado");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(state.contentNotification),
          duration: Duration(seconds: 3),
        )
      );
      setState(() {
        colorButton = Colors.green;
      });
    }
  }
}
