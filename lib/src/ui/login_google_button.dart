import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase_bloc/src/bloc/login_bloc/bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleAuthButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Loggin...'),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
        BlocProvider.of<LoginBloc>(context).add(LoginWithGooglePressed());
      },
    );
  }
}
