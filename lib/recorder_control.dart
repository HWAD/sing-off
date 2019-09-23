import 'package:flutter/material.dart';

class RecorderControl extends StatelessWidget {
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeSongs;
  final Function changeFeed;

  RecorderControl(this.changeRecorder, this.changePlayer, this.changeSongs, this.changeFeed);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * (7 / 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
          child: InkWell(
              onTap: () {
                changeRecorder(false);
                changeFeed(true);
              },
              child: Icon(Icons.home)),
        ),
        Container(
                    child: Text(
                      'Sing-Off',
                    ),
                  ),
        Container(
          // height: MediaQuery.of(context).size.height * (7 / 100),
          // padding: EdgeInsets.only(
          //     left: MediaQuery.of(context).size.width * (6 / 100)),
          child: InkWell(
              onTap: () {
                changePlayer(false);
                changeSongs(true);
                changeRecorder(false);
              },
              child: Icon(
                Icons.music_video,
              )),
        ),
        
      ]),
    );
  }
}
