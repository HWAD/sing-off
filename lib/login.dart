import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final Function setLogin;
  final Function changeFeed;
  final Function setUsername;

  String usernameInput;

  Login(this.setLogin, this.changeFeed, this.setUsername);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Colors.deepPurple,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'What\'s your name?',
                          fillColor: Colors.black,
                        ),
                        onChanged: (val) {
                          usernameInput = val;
                        },
                      ),
                      FlatButton(
                        child: Text('Enter'),
                        textColor: Colors.blue,
                        onPressed: () {
                          if (usernameInput == null ||
                              usernameInput.length < 2) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                      "Insert a valid name",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: null,
                                  );
                                });
                          } else {
                            setUsername(usernameInput);
                            setLogin(false);
                            changeFeed(true);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
