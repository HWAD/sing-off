import 'package:flutterkaraoke/model_song.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'dart:collection';
import 'package:noise_meter/noise_meter.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';

class Recorder extends StatefulWidget {
  final Function setFilePathToPlay;
  final FlutterSound flutterSound;
  final ModelSong selectedSong;
  final Function setCurrentLyric;
  // final List<Duration> highlightDurations;
  // final Function setHighlightDurations;
  String currentLyric;
  final Function setDecibels;
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeSongs;

  Recorder({
    Key key,
    @required this.setFilePathToPlay,
    @required this.currentLyric,
    @required this.flutterSound,
    @required this.selectedSong,
    @required this.setCurrentLyric,
    // @required this.highlightDurations,
    // @required this.setHighlightDurations,
    @required this.setDecibels,
    @required this.changeRecorder,
    @required this.changePlayer,
    @required this.changeSongs,
  }) : super(key: key);

  @override
  _Recorder createState() {
    return _Recorder(
        setFilePathToPlay,
        currentLyric,
        flutterSound,
        selectedSong,
        setCurrentLyric,
        // highlightDurations,
        // setHighlightDurations,
        setDecibels,
        changeRecorder,
        changePlayer,
        changeSongs);
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _Recorder extends State<Recorder> with WidgetsBindingObserver {
  CameraController controller;
  String imagePath;
  String videoPath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;
  bool letsBeginColor = true;
  String filePathExtractor;
  List<CameraDescription> cameras;
  Function setFilePathToPlay;
  String currentLyric;
  FlutterSound flutterSound;
  ModelSong selectedSong;
  Function setCurrentLyric;
  List<Duration> highlightDurations = new List<Duration>();
  // Function setHighlightDurations;
  Function setDecibels;
  Function changeRecorder;
  Function changePlayer;
  Function changeSongs;
  String domesticLyric = '';

  _Recorder(
    this.setFilePathToPlay,
    this.currentLyric,
    this.flutterSound,
    this.selectedSong,
    this.setCurrentLyric,
    // this.highlightDurations,
    // this.setHighlightDurations,
    this.setDecibels,
    this.changeRecorder,
    this.changePlayer,
    this.changeSongs,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    fetchCameras().then((cameras) {
      controller = CameraController(
        cameras[1],
        ResolutionPreset.medium,
        enableAudio: enableAudio,
      );
      controller.addListener(() {
        if (mounted) setState(() {});
        if (controller.value.hasError) {
          // showInSnackBar('Camera error ${controller.value.errorDescription}');
        }
      });

      try {
        controller.initialize();
      } on CameraException catch (e) {
        _showCameraException(e);
      }

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void setDomesticLyric(String line) {
    setState(() {
      domesticLyric = line;
    });
  }

  void setHighlightDurations(List<Duration> durations) {
    setState(() {
      highlightDurations = durations;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * (88 / 100),
        child: GestureDetector(
          onPanUpdate: (details) {
            // if (details.delta.dx > 50) {
            //   changeRecorder(false);
            //   changePlayer(true);
            // }
            // if ((-details.delta.dx) < -100) {
            //   changePlayer(false);
            //   changeSongs(true);
            //   changeRecorder(false);
            // }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      child: Stack(children: [
                        _cameraPreviewWidget(),
                        Container(
                          color: Colors.grey[600].withOpacity(0.7),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 5),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: highlightDurations.length >= 1
                                          ? domesticLyric.substring(
                                              0, highlightDurations.length - 1)
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        foreground: Paint()
                                          ..style = PaintingStyle.fill
                                          ..strokeWidth = 1
                                          ..color = Colors.red[700],
                                      )),
                                  TextSpan(
                                    text: highlightDurations.length >= 1
                                        ? domesticLyric.substring(
                                            highlightDurations.length - 1)
                                        : domesticLyric,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: controller != null &&
                              controller.value.isRecordingVideo
                          ? Colors.redAccent
                          : Colors.grey,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              _captureControlRowWidget(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // children: <Widget>[
                  //   Center(child: Text("For Visual", textAlign: TextAlign.center))
                  // ],
                ),
              ),
            ],
          ),
        ));
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        '',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Container(
        // aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // IconButton(
        //   icon: const Icon(Icons.videocam),
        //   color: Colors.blue,
        InkWell(
            child: Text("Let's Begin",
                style: TextStyle(
                  color: letsBeginColor ? Colors.orange : Colors.grey,
                  fontSize: 20,
                )),
            onTap: () {
              if (controller != null &&
                  controller.value.isInitialized &&
                  !controller.value.isRecordingVideo) {
                letsBeginColor = !letsBeginColor;
                onVideoRecordButtonPressed();
              } else {
                return null;
              }
            }),
        IconButton(
          icon: const Icon(Icons.stop),
          color: Colors.red,
          onPressed: controller != null &&
                  controller.value.isInitialized &&
                  controller.value.isRecordingVideo
              ? onStopButtonPressed
              : null,
        )
      ],
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: enableAudio,
    );
    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        // showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> startAudio() async {
    LinkedHashMap<String, String> mappedLyrics = selectedSong.lyrics
        .split('[')
        .fold(new LinkedHashMap<String, String>(), (accumuLines, currentLine) {
      if (currentLine != "") {
        accumuLines[currentLine.split(']')[0]] = currentLine.split(']')[1];
      }
      return accumuLines;
    });
    try {
      _noiseSubscription =
          new Noise(500).noiseStream.listen((e) => setDecibels(e.decibel));
      // await flutterSound.startRecorder('sdcard/recorded.m4a',
      //     bitRate: 256000,
      //     sampleRate: 44100,
      //     androidEncoder: AndroidEncoder.AAC);
      await flutterSound.startPlayer(selectedSong.downloadURL);
      DateTime lyricStartTime = DateFormat('mm:ss.SS', 'en_US')
          .parseUTC(mappedLyrics.keys.first.padRight(9, "0"));
      String lyricLine = mappedLyrics[mappedLyrics.keys.first];
      DateTime highlightStartTime = lyricStartTime;
      String highlightLine = lyricLine;
      mappedLyrics.remove(mappedLyrics.keys.first);

      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          DateTime currentTime = new DateTime.fromMillisecondsSinceEpoch(
              e.currentPosition.toInt(),
              isUtc: true);
          if (mappedLyrics.length != 0) {
            DateTime lyricStopTime = DateFormat('mm:ss.SS', 'en_US')
                .parseUTC(mappedLyrics.keys.first.padRight(9, "0"));
            if (lyricStartTime.isBefore(currentTime) &&
                currentTime.isBefore(lyricStopTime)) {
              setDomesticLyric(lyricLine);
              setCurrentLyric(lyricLine);
              highlightStartTime = lyricStartTime;
              highlightLine = lyricLine;
              lyricStartTime = lyricStopTime;
              lyricLine = mappedLyrics[mappedLyrics.keys.first];
              setHighlightDurations(new List<Duration>());
              if (highlightDurations.length >= 1) {
                highlightDurations.removeRange(0, highlightDurations.length);
              }
              mappedLyrics.remove(mappedLyrics.keys.first);
            }
          }
          if (highlightStartTime
                  .add(highlightDurations.fold(
                      lyricStartTime.difference(highlightStartTime) ~/
                          highlightLine.length,
                      (accumuDuration, currentDuration) =>
                          currentDuration + accumuDuration))
                  .isBefore(currentTime) &&
              currentTime.isBefore(lyricStartTime)) {
            highlightDurations.add(
                lyricStartTime.difference(highlightStartTime) ~/
                    highlightLine.length);
            setHighlightDurations(highlightDurations);
          }
        }
      });
    } catch (err) {
      print('Start Error! $err');
    }
  }

  Future stopAudio() async {
    try {
      await _noiseSubscription.cancel();
      // await flutterSound.stopRecorder();
      await flutterSound.stopPlayer();
      await _playerSubscription.cancel();
      await uploadAudio();
    } catch (err) {
      print("Stop Error! $err");
    }
  }

//Database = add song
  void addVideo(Map<String, dynamic> upload) {
    const url = 'https://flutterkaraoke.firebaseio.com/videos.json';
    http.post(url, body: json.encode(upload)).then((response) {});
  }

//Storage & Database Upload
  void _megaUpload(path) async {
    //wait for download url
    String url = await videoUpload(path);

    ModelSong uploadObject = ModelSong(
      title: selectedSong.title,
      artist: selectedSong.artist,
      downloadURL: url,
      category: 'Video',
      image: 'assets/steppico.jpeg',
      score: 100,
      isFavorite: false,
    );
    print(uploadObject.toJson());
    Map<String, dynamic> uploadJSON = uploadObject.toJson();
    addVideo(uploadJSON);
  }

  StreamSubscription<PlayStatus> _playerSubscription;
  StreamSubscription<NoiseEvent> _noiseSubscription;
  final StorageReference storageReference = FirebaseStorage().ref();

  Future<String> videoUpload(String path) async {
    File videoFile = File(path);
    setFilePathToPlay(path);
    List storagePath = path.split('/');
    StorageUploadTask ref = storageReference
        .child("videoFiles/" + storagePath[storagePath.length - 1])
        .putFile(videoFile);
    String location = await (await ref.onComplete).ref.getDownloadURL();
    return location;
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      filePathExtractor = filePath;
    });
  }

  void onStopButtonPressed() {
    stopAudio();
    stopVideoRecording().then((_) {
      if (mounted) setState(() {
      });
    });
  }

  void onPauseButtonPressed() {
    pauseVideoRecording().then((_) {
      if (mounted) setState(() {});
    });
  }

  void onResumeButtonPressed() {
    resumeVideoRecording().then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<String> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      return null;
    }

    final String dirPath = 'sdcard';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';
    print('filePath: $filePath');
    setFilePathToPlay(filePath);

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
      startAudio();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
      _megaUpload(filePathExtractor);
      changeRecorder(false);
      changePlayer(true); 
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    await _startVideoPlayer();
  }

  Future<void> pauseVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.pauseVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.resumeVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> _startVideoPlayer() async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imagePath = null;
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
  }

  Future<String> uploadAudio(
      [String audioFileName, String audioTitle, String artist]) async {
    if (audioFileName == null) {
      audioFileName = "RyoheiRecorded2.m4a";
    }
    File audioFile = File("sdcard/recorded.m4a");
    StorageUploadTask ref = storageReference
        .child("audioFiles/" + audioFileName)
        .putFile(audioFile);
    String location = await (await ref.onComplete).ref.getDownloadURL();
    return location;
  }

  Future<String> _uploadAudio([String audioFileName]) async {
    if (audioFileName == null) {
      audioFileName = "RyoheiRecorded2.m4a";
    }

    File audioFile = File("sdcard/recorded.m4a");

    StorageUploadTask ref = storageReference
        .child("audioFiles/" + audioFileName)
        .putFile(audioFile);
    String location = await (await ref.onComplete).ref.getDownloadURL();
    print(location.toString());
    return location;
  }

  Future<List> fetchCameras() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
    return cameras;
  }
}
