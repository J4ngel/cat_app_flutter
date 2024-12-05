import 'package:flutter/material.dart';

class TutoScreen extends StatelessWidget {
  const TutoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Colors.indigo,
          child: Column(
            children: [
              Text("Hola que hace"),
              Text("See you later aligator")
            ],
          ),
        ),
      ),
    );
  }
}
