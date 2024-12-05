
import 'package:flutter/material.dart';

class LoginOrganism extends StatelessWidget {
   const LoginOrganism({
     super.key,
     required this.onChangeEmail,
     required this.onChangePassword,
     required this.onPressLogin,
     required this.emailValidator,
     required this.passwordValidator,
     this.passwordValidateMode = AutovalidateMode.onUserInteraction,
     this.emailValidateMode = AutovalidateMode.onUserInteraction
});
   final Function(String)? onChangeEmail;
   final Function(String)? onChangePassword;
   final String? Function(String?)? emailValidator;
   final String? Function(String?)? passwordValidator;
   final VoidCallback onPressLogin;
   final AutovalidateMode passwordValidateMode;
   final AutovalidateMode emailValidateMode;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            key: const Key('login-organism-email-field'),
            autovalidateMode: emailValidateMode,
            validator: emailValidator,
            decoration: const InputDecoration(
                label: Text('Correo')
            ),
            onChanged: onChangeEmail,
          ),
          TextFormField(
            autovalidateMode: passwordValidateMode,
            validator: passwordValidator,
            decoration: const InputDecoration(
                label: Text('Contraseña')
            ),
            onChanged: onChangePassword,
          ),
          ElevatedButton(
              onPressed: onPressLogin,
              child: const Text('Iniciar Sesion')
          )
        ],
      ),
    );
  }
}
