import 'package:cat_app_flutter/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';

abstract class AppConfig {
  static AppConfig instance = _AppConfigImpl();

  Future start();
}

class _AppConfigImpl implements AppConfig {
  @override
  Future start() async {
    WidgetsFlutterBinding.ensureInitialized();

    await initializer();
  }
}