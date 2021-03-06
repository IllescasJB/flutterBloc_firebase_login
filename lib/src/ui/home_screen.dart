import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase_bloc/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_firebase_bloc/src/bloc/authentication_bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text('Bienvenido $name!'),
          ),
        ],
      ),
    );
  }
}
