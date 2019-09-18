import 'package:flutter/material.dart';

class PlayControl extends StatelessWidget {
  final Function changePlay;
  final Function changeScore;
  final Function changeMenu;

  PlayControl(this.changePlay, this.changeScore, this.changeMenu);

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
                changeScore(false);
                changeMenu(true);
                changePlay(false);
              },
              child: Icon(Icons.arrow_back_ios,)
            ), 
            ),
            Container( 
              padding: EdgeInsets.only(left: 280),
              child:InkWell(
                onTap: () {
                  changePlay(false);
                  changeScore(true);
                },
                child: Icon(Icons.arrow_forward_ios)), 
            ),
          ]),
          ]),
    );
  }
}
