import 'package:flutter/material.dart';
import 'package:flutterkaraoke/model_song.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class SongAlbum extends StatelessWidget {
  final Function changeSongs;
  final Function changeRecorder;
  final List<ModelSong> allSongs;
  final Function setSelectedSong;
  final String selectedCategory;
  final _controller = ScrollController();
  List filteredAllSongs;

  SongAlbum(this.changeSongs, this.changeRecorder, this.allSongs,
      this.setSelectedSong, this.selectedCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.465,
        margin: EdgeInsets.only(top: 10),
        color: Colors.grey[900],
        child: FadingEdgeScrollView.fromScrollView(
          gradientFractionOnEnd: 0.25,
          child: ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                  children: allSongs.where((song) {
                    if (selectedCategory == "All") {
                      return true;
                    } else {
                      return song.category == selectedCategory;
                    }
                  }).map((element) {
                    return Container(
                        color: Colors.black38,
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
                                  width: 50,
                                  child: Container(
                                      alignment: Alignment.bottomRight,
                                      padding: EdgeInsets.only(
                                          top: 1, left: 1, right: 1),
                                      child: Text(element.length,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.3),
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
                                      image: NetworkImage(element.imageURL),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  padding: EdgeInsets.only(left: 3, right: 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(element.title,
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text(element.artist,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[],
                                  ),
                                )
                              ],
                            )));
                  }).toList(),
                )
              ]),
        ));
  }
}
