import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function setLogin;
  final Function changeFeed;

  Login(this.setLogin, this.changeFeed);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height *.5,
      child: Column(
          children: <Widget> [
            InkWell(onTap: () {
            setLogin(false);
            changeFeed(true);
          },
            child: Container(
              height: 200,
              child: Text("Login Click Me"),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height *.5,
            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white54,
                                  width: 1,
                                ),
                                image: DecorationImage(
                                  image:
                                      new AssetImage("assets/steppico.jpeg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
          )
          ]
      )
    );
  }
}
