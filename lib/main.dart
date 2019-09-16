import 'package:flutter/material.dart';
import './manager.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> _requestPermission(PermissionGroup permission) async {
  var result = await PermissionHandler().requestPermissions([permission]);
  if (result[permission] == PermissionStatus.granted) {
    return true;
  }
  return false;
}

Future<void> _requestingPermission() async {
  await _requestPermission(PermissionGroup.storage);
  await _requestPermission(PermissionGroup.microphone);
}

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _requestingPermission();
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


