import 'package:flutter/material.dart';

class RecorderControl extends StatelessWidget {
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeSongs;

  RecorderControl(this.changeRecorder, this.changePlayer, this.changeSongs);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[900],
      padding: EdgeInsets.only(left: 30),
      child: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              padding: EdgeInsets.only(top: 10),
              child: InkWell(
              onTap: () {
                changePlayer(false);
                changeSongs(true);
                changeRecorder(false);
              },
              child: Icon(Icons.arrow_back_ios,)
            ), 
            ),
            Container( 
              padding: EdgeInsets.only(left: 280),
              child:InkWell(
                onTap: () {
                  changeRecorder(false);
                  changePlayer(true);
                },
                child: Icon(Icons.arrow_forward_ios)), 
            ),
          ]),
          ]),
    );
  }
}
