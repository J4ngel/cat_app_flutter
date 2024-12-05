import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../config/mocks/authentication/aplocation/bloc/mock_login_bloc.mock.dart';

final getIt = GetIt.instance;

void main (){
  late MockLoginBloc mockLoginBloc;
  setUpAll((){
    mockLoginBloc = MockLoginBloc();

    when(()=> mockLoginBloc.state).thenReturn(InitialState());

    getIt.registerFactory<LoginBloc>(()=> mockLoginBloc);
  });

  Widget buildSut(){
    return const MaterialApp(
      home: WelcomeScreen(),
    );
  }

  group('WelcomeScreen existence test', (){
    testWidgets('Verify Principal Icon exist', (tester) async {
      // Arrange
      // Act
      await tester.pumpWidget(buildSut());
      final finder = find.byType(Icon);
      // Assert
      expect(finder, findsOneWidget);

    });
    
    testWidgets('Verify Principal Email Input exist', (tester) async {
      // Arrange
      // Act
      await tester.pumpWidget(buildSut());
      final finder = find.byKey(const Key('login-organism-email-field'));
      // Assert
      expect(finder, findsOneWidget);

    });
    
    testWidgets('Verify Text register exist', (tester) async {
      // Arrange
      // Act
      await tester.pumpWidget(buildSut());
      final finder = find.text('Registrarse');
      // Assert
      expect(finder, findsOneWidget);

    });
  });
}