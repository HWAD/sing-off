import 'package:flutter/material.dart';

import './manager.dart';
import './_filepicker.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Karaoke Mania'),
        ),
        body: Manager(startingMenu: 'Start Value'),
      ),
    );
  }
}
