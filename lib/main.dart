import 'package:cat_app_flutter/app.dart';
import 'package:cat_app_flutter/config/app_config.dart';
import 'package:flutter/material.dart';

void main() async {

  await AppConfig.instance.start();

  runApp(const App());
}
