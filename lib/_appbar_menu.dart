import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget {
  final Function changeUpload;
  final Function changeMenu;

  AppBarMenu(this.changeUpload, this.changeMenu);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RaisedButton(
        color: Colors.deepOrange,
        onPressed: () {
          // changeMenu(false);
          // changeUpload(true);
        },
        child: Text('Upload'),
      ),
      // RaisedButton(
      //   color: Colors.deepOrange,
      //   onPressed: () {
      //     // changeScore(false);
      //     // changePlay(true);
      //   },
      //   child: Text('Logout'),
      // )
    ]);
  }
}
