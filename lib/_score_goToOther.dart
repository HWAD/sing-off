import 'package:flutter/material.dart';

class ScoreGoToOther extends StatelessWidget {
  final Function changeMenu;
  final Function changePlay;
  final Function changeScore;

  ScoreGoToOther(this.changeMenu, this.changePlay, this.changeScore);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.only(left: 30),
      child: Column(
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container( 
              padding: EdgeInsets.only(top: 10),
              child:InkWell(
                onTap: () {
                  changeScore(false);
                  changePlay(true);
                },
                child: Icon(Icons.arrow_back_ios)), 
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 280),
              child: InkWell(
              onTap: () {
                changeScore(false);
                changeMenu(true);
              },
              child: Icon(Icons.home,)
            ), 
            ),
          ])]),
    );
  }
}


/*
return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.only(left: 30),
      child: Column(
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              padding: EdgeInsets.only(top: 10),
              child: InkWell(
              onTap: () {
                changeScore(false);
                changeMenu(true);
              },
              child: Icon(Icons.arrow_back_ios,)
            ), 
            ),
            Container( 
              padding: EdgeInsets.only(left: 280),
              child:InkWell(
                onTap: () {
                  changeScore(false);
                  changePlay(true);
                },
                child: Icon(Icons.home)), 
            ),
          ])]),
    );

*/
