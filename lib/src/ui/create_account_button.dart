import 'package:flutter/material.dart';
import 'package:login_firebase_bloc/src/repository/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;
  const CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Create Account'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Container();
            },
          ),
        );
      },
    );
  }
}
