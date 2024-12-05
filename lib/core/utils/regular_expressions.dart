abstract class RegularExpressions {
  static RegExp get identifyMinimumUpperCase => RegExp(r'[A-Z]');

  static RegExp get identifyMinimumLowerCase => RegExp(r'[a-z]');

  static RegExp get identifyEmail => RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
}