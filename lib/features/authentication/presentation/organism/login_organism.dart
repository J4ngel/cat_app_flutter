
import 'package:flutter/material.dart';

class LoginOrganism extends StatelessWidget {
   const LoginOrganism({
     super.key,
     required this.onChangeEmail,
     required this.onChangePassword,
     required this.onPressLogin
});
   final Function(String)? onChangeEmail;
   final Function(String)? onChangePassword;
   final VoidCallback onPressLogin;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                label: Text('Correo')
            ),
            onChanged: onChangeEmail,
          ),
          TextFormField(
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
