import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';

class MenuAlbum extends StatelessWidget {
  final Function changeMenu;
  final Function changePlay;
  final List<ModelSong> allSongs;
  final Function setSelectedSong;

  MenuAlbum(
      this.changeMenu, this.changePlay, this.allSongs, this.setSelectedSong);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 5,
              ),
              padding: EdgeInsets.all(5),
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Your Album',
                  style: TextStyle(fontSize: 20),
                ),
                elevation: 5,
              ),
            ),
            Column(
              children: allSongs.map((element) {
                return Card(
                    child: InkWell(
                        onTap: () {
                          changeMenu(false);
                          changePlay(true);
                          setSelectedSong(element);
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 60,
                              child: Container(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 1),
                                  child: Text(element.score.toString(),
                                      style: TextStyle(
                                        fontSize: 7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ))),
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image:
                                      new AssetImage(element.image.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(element.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(element.artist,
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text('Favorite', style: TextStyle()),
                                    textColor: Colors.blue,
                                    onPressed: () {
                                      print('I just added this to favorites!');
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        )));
              }).toList(),
            )
          ]),
    );
  }
}
