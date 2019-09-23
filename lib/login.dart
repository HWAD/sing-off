import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function setLogin;
  final Function changeFeed;
  final Function setUsername;
  String usernameInput;

  Login(this.setLogin, this.changeFeed, this.setUsername);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            // padding: EdgeInsets.only(bottom: 40),
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        fillColor: Colors.white,
                      ),
                      onChanged: (val) {
                        usernameInput = val;
                      },
                    ),
                    FlatButton(
                      child: Text('Login'),
                      textColor: Colors.white,
                      onPressed: () {
                        setUsername(usernameInput);
                        setLogin(false);
                        changeFeed(true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height *.5,
          //   decoration: BoxDecoration(
          //                       border: Border.all(
          //                         color: Colors.white54,
          //                         width: 1,
          //                       ),
          //                       image: DecorationImage(
          //                         image:
          //                             new AssetImage("assets/steppico.jpeg"),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          // )
        ]));
  }
}
