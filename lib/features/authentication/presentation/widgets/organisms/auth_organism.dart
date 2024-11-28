import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthOrganism extends StatelessWidget {
  const AuthOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetIt.instance.get<LoginBloc>(),
        child: _View()
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
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(10))
                    ),
                    child: const Icon(Icons.arrow_forward),
                  ))
            ],
          ),
          body: LayoutBuilder(
              builder: (context, constrains){
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constrains.maxHeight),
                    child: IntrinsicHeight(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 34),
                                    child: Image.asset('assets/moon.png', width: 150, height: 150, fit: BoxFit.cover,),
                                  ),
                                  Positioned(top: 50, right: 80, child: Image.asset('assets/woman-reading.png', width: 120, height: 120,))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(40),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(40))
                                ),
                                child: Form(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InputForm(
                                        label: "Email Address",
                                        onChangeText: (value){
                                          final event = ChangeEmailEvent(newEmail: value);
                                          context.read<LoginBloc>().add(event);
                                        },
                                      ),
                                      InputForm(
                                        label: "Password",
                                        description: "Forgot Password?",
                                        trailingButton: IconButton(
                                            onPressed: (){},
                                            icon: const Icon(Icons.remove_red_eye)
                                        ),
                                        onChangeText: (value){
                                          final event = ChangePasswordEvent(newPassword: value);
                                          context.read<LoginBloc>().add(event);
                                        },
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.amber,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              textStyle: const TextStyle(fontWeight: FontWeight.bold)
                                            ),
                                            onPressed: (){},
                                            child: const Text('Log In')
                                        ),
                                      ),
                                      const Text('Or', style: TextStyle(fontWeight: FontWeight.bold),),
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SocialButton(socialIcon: Icon(Icons.explore, color: Colors.red,)),
                                          SocialButton(socialIcon: Icon(Icons.apple, color: Colors.black,)),
                                          SocialButton(socialIcon: Icon(Icons.facebook, color: Colors.blue,))
                                        ],
                                      ),
                                      RichText(
                                          text: const TextSpan(
                                              text: 'Don\'t have han account? ',
                                              children: [
                                                TextSpan(
                                                    text: 'Sign up',
                                                    style: TextStyle(
                                                        color: Colors.amber,
                                                        fontWeight: FontWeight.bold
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          )
      ),
    );
  }
  void _listener (BuildContext context, state){
    if(state is DataLoginUpdated){
      print(state.data.email);
      print(state.data.password);
    }
  }
}


class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.label,
    this.description,
    this.trailingButton,
    this.onChangeText
  });

  final String label;
  final String? description;
  final Widget? trailingButton;
  final Function(String)? onChangeText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),
                  label
              )
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: trailingButton,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
            ),
            filled: true,
            fillColor: Colors.grey[200]
          ),
          onChanged: onChangeText,
        ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 11
                    ),
                    description!
                )
            ),
          )
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.socialIcon});
  final Icon socialIcon;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(50, 50),
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.zero
        ),
        onPressed: (){},
        child: socialIcon
    );
  }
}

