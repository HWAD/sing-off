import 'package:flutter/material.dart';

class RecorderControl extends StatelessWidget {
  final Function changeRecorder;
  final Function changePlayer;
  final Function changeSongs;

  RecorderControl(this.changeRecorder, this.changePlayer, this.changeSongs);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * (7 / 100),
      child: 
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).size.height * (7 / 100),
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * (6 / 100)),
              child: InkWell(
              onTap: () {
                changePlayer(false);
                changeSongs(true);
                changeRecorder(false);
              },
              child: Icon(Icons.arrow_back_ios,)
            ), 
            ),
            // Container( 
            //   child:InkWell(
            //     onTap: () {
            //       changeRecorder(false);
            //       changePlayer(true);
            //     },
            //     child: Icon(Icons.arrow_forward_ios)), 
            // ),
          ]),
    );
  }
}
