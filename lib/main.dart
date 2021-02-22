import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:login_firebase_bloc/src/bloc/authentication_bloc/bloc.dart';
import 'package:login_firebase_bloc/src/bloc/simple_bloc_observer.dart';
import 'package:login_firebase_bloc/src/repository/user_repository.dart';
import 'package:login_firebase_bloc/src/ui/home_screen.dart';
import 'package:login_firebase_bloc/src/ui/login_screen.dart';
import 'package:login_firebase_bloc/src/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;
  const App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is Uninitialized) {
          return SplashScreen();
        }
        if (state is Authenticated) {
          return HomeScreen(name: state.displayName);
        }
        if (state is Unauthenticated) {
          return LoginScreen(userRepository: _userRepository);
        }
        return Container();
      }),
    );
  }
}
