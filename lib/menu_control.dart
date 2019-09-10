import 'package:flutter/material.dart';

class MenuControl extends StatelessWidget {
  final Function addMenu;
  final Function changeMenu;
  final Function changePlay;

  MenuControl(this.addMenu, this.changeMenu, this.changePlay);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      onPressed: () {
        addMenu('Add this line in Menu');
        changeMenu(false);
        changePlay(true);
      },
      child: Text('This is Menu'),
    );
  }
}
