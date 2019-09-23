import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function setLogin;
  final Function setFeed;

  Login(this.setLogin, this.setFeed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () {
            setLogin(false);
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
