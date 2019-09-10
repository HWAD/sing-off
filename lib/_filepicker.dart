import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterkaraoke/model_song.dart';
import "./_model.dart";
import "package:flutterkaraoke/_menu.dart";

class FilePickerDemo extends StatefulWidget {
  @override
  _FilePickerDemoState createState() => new _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  String titleInput;
  String artistInput;
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension = '.m4a';
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.CUSTOM;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

  void addSong(Map<String, dynamic>upload) {
    print(upload);
    // FirebaseDataClass song
    const url = 'https://flutterkaraoke.firebaseio.com/songs.json';
    http.post(url, body: json.encode(upload)).then((response) {
      print('posted');
    });
  }

  void _megaUpload() async {
    //wait for download url
    String url = await uploadAudio(_path, titleInput);
    //create a new instance of Model Song
    ModelSong uploadObject = ModelSong(
      title: titleInput,
      artist: artistInput,
      downloadURL: url,
      image: '',
      score: 100,
      isFavorite: false,
    );
    print(uploadObject.toJson());
    Map<String, dynamic> uploadJSON = uploadObject.toJson();
    addSong(uploadJSON);
  }

  final StorageReference storageReference = FirebaseStorage().ref();

  Future<String> uploadAudio(String path, String audioFileName) async {
    if (audioFileName == null) {
      throw ("Error, no filename provided");
    }

    File audioFile = File(path);
    // }
    StorageUploadTask ref = storageReference
        .child("audioFiles/" + audioFileName + ".m4a")
        .putFile(audioFile);
    String location = await (await ref.onComplete).ref.getDownloadURL();
    return location;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                            print('FilePicker button pressed');
                            _megaUpload();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
      Center(
          child: new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100.0),
                child: _pickingType == FileType.CUSTOM
                    ? new TextFormField(
                        maxLength: 15,
                        autovalidate: true,
                        controller: _controller,
                        decoration:
                            InputDecoration(labelText: 'File extension'),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                          if (reg.hasMatch(value)) {
                            _hasValidMime = false;
                            return 'Invalid format';
                          }
                          _hasValidMime = true;
                          return null;
                        },
                      )
                    : new Container(),
              ),
              new Container(
                child: new RaisedButton(
                  onPressed: () => _openFileExplorer(),
                  child: new Text("Open file picker"),
                ),
              ),
              new Builder(
                builder: (BuildContext context) => _loadingPath
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: const CircularProgressIndicator())
                    : _path != null || _paths != null
                        ? new Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: new Scrollbar(
                                child: new ListView.separated(
                              itemCount: _paths != null && _paths.isNotEmpty
                                  ? _paths.length
                                  : 1,
                              itemBuilder: (BuildContext context, int index) {
                                final bool isMultiPath =
                                    _paths != null && _paths.isNotEmpty;
                                final String name = 'File $index: ' +
                                    (isMultiPath
                                        ? _paths.keys.toList()[index]
                                        : _fileName ?? '...');
                                final path = isMultiPath
                                    ? _paths.values.toList()[index].toString()
                                    : _path;

                                return new ListTile(
                                  title: new Text(
                                    name,
                                  ),
                                  subtitle: new Text(path),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      new Divider(),
                            )),
                          )
                        : new Container(),
              ),
            ],
          ),
        ),
      )),
    ]);
  }
}
