import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function setLogin;
  final Function changeFeed;

  Login(this.setLogin, this.changeFeed);

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: InkWell(onTap: () {
      setLogin(false);
      changeFeed(true);
    },
    child: Text("Login Click Me"))));
  }
}
