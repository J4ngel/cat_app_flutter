import 'package:flutter/material.dart';

abstract class AppConfig {
  static AppConfig instance = _AppConfigImpl();

  Future start();
}

class _AppConfigImpl implements AppConfig {
  @override
  Future start() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}