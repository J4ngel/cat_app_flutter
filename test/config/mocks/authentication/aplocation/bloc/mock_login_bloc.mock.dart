import 'package:bloc_test/bloc_test.dart';
import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';

final class MockLoginBloc extends MockBloc<LoginEvent, LoginState> implements LoginBloc {}