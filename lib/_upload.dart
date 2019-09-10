import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';

import "./_songData.dart";
import "./_model.dart";
import "./_menu.dart";

class Upload extends StatelessWidget {
  final titleController = TextEditingController();
  final artistController = TextEditingController();
  String titleInput;
  String artistInput;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Upload New Song!'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (val) {
                      titleInput = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Artist'),
                    onChanged: (val) => artistInput = val,
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Add Song'),
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titleInput);
                          print(artistInput);
                        },
                      ),
                      FlatButton(
                        child: Text("File"),
                        textColor: Colors.purple,
                        onPressed: () {
                          print('FilePicker');
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
