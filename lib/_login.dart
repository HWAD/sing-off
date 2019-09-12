import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Container(
        height: 270,
        // width: MediaQuery.of(context).size.width,
        child: Container(
          height: 120.0,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage(
              'assets/login.jpg'),
          fit: BoxFit.fill,
        ),
          ),
        ),
      )
      ],
    );
  }
}
