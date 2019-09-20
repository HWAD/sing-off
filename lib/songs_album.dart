import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';

class SongAlbum extends StatelessWidget {
  final Function changeSongs;
  final Function changeRecorder;
  final List<ModelSong> allSongs;
  final Function setSelectedSong;
  final String selectedCategory;
  List filteredAllSongs;

  SongAlbum(this.changeSongs, this.changeRecorder, this.allSongs,
      this.setSelectedSong, this.selectedCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
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
                            changeSongs(false);
                            changeRecorder(true);
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
                              width: MediaQuery.of(context).size.width / 1.5,
                              padding: EdgeInsets.only(left: 3, right: 2),
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
