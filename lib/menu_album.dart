import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';

class MenuAlbum extends StatelessWidget {
  final Function changeMenu;
  final Function changePlay;
  final List<ModelSong> allSongs;
  final Function setSelectedSong;
  final String selectedCategory;
  List filteredAllSongs;

  MenuAlbum(this.changeMenu, this.changePlay, this.allSongs,
      this.setSelectedSong, this.selectedCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      margin: EdgeInsets.only(top: 8),
      color: Colors.grey[800],
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: allSongs
                  .where((song) => song.category == selectedCategory)
                  .map((element) {
                return Container(
                  color: Colors.black38,
                  margin: EdgeInsets.only(bottom:1, top: 1),
                    child: InkWell(
                        onTap: () {
                          if (element.category != 'Video') {
                            changeMenu(false);
                            changePlay(true);
                            setSelectedSong(element);
                          }
                          if (element.category == 'Video') {
                            print('It\'s a video');
                          }
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
                                  color: Colors.white54,
                                  width: 1,
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
