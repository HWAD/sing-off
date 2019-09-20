import 'package:flutter/material.dart';

class RecorderControl extends StatelessWidget {
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeSongs;

  RecorderControl(this.changeRecorder, this.changePlayer, this.changeSongs);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 30),
      child: Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * (10 / 100),
              // padding: EdgeInsets.only(top: 10),
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
              // padding: EdgeInsets.only(left: 280),
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
