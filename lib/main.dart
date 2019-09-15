import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import './manager.dart';
import './play_karaoke.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        body: Manager(startingMenu: 'Start Value'),
      ),
    );
  }
}
