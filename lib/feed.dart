import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:video_player/video_player.dart';
import './model_song.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Feed extends StatefulWidget {
  final List<ModelSong> _allVideos;
  final Function changeCategory;
  final Function changeFeed;
  final Function setFilePathToPlay;
  final Function changePlayer;
  final Function getAllVideos;
  final Function changeSongs;

  Feed(
      this._allVideos,
      this.changeCategory,
      this.changeFeed,
      this.setFilePathToPlay,
      this.changePlayer,
      this.getAllVideos,
      this.changeSongs);

  @override
  _Feed createState() {
    return _Feed(_allVideos, changeCategory, changeFeed, setFilePathToPlay,
        changePlayer, getAllVideos, changeSongs);
  }
}

class _Feed extends State<Feed> {
  List<ModelSong> allVideos = [];
  Function changeCategory;
  Function changeFeed;
  Function setFilePathToPlay;
  Function changePlayer;
  Function getAllVideos;
  Function changeSongs;
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  _Feed(this.allVideos, this.changeCategory, this.changeFeed,
      this.setFilePathToPlay, this.changePlayer, this.getAllVideos, this.changeSongs);

Future<void> refresh() async {
    print("ingetallvideos");
    const url = 'https://flutterkaraoke.firebaseio.com/videos.json';
    http.get(url).then((response) {
      Map<String, dynamic> mappedBody = json.decode(response.body);
      List<dynamic> dynamicList = mappedBody.values.toList();
      List<ModelSong> modelVideoList = [];
      for (int i = dynamicList.length-1; i >= 0; i--) {
        modelVideoList.add(ModelSong(
            title: dynamicList[i]["title"],
            artist: dynamicList[i]["artist"],
            downloadURL: dynamicList[i]["downloadURL"],
            length: dynamicList[i]["length"],
            category: dynamicList[i]["category"],
            image: dynamicList[i]["image"],
            score: dynamicList[i]["score"],
            isFavorite: dynamicList[i]["isFavorite"]));
      }
      setState(() {
        allVideos = modelVideoList;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  // void _onRefresh() async{
  //   // monitor network fetch
  //   getAllVideos();
  //   _refreshController.refreshCompleted();
  // }

  // void _onLoading() async{
  //   // monitor network fetch
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()
  //   if(mounted)
  //   setState(() {

  //   });
  //   _refreshController.loadComplete();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,
        // child: SmartRefresher(
        //   enablePullDown: true,
        //   enablePullUp: true,
        //   header: WaterDropHeader(),
        //   footer: CustomFooter(
        //     builder: (BuildContext context,LoadStatus mode){
        //       Widget body ;
        //       if(mode==LoadStatus.idle){
        //         body =  Text("pull up load");
        //       }
        //       else if(mode==LoadStatus.loading){
        //         body =  CupertinoActivityIndicator();
        //       }
        //       else if(mode == LoadStatus.failed){
        //         body = Text("Load Failed!Click retry!");
        //       }
        //       else{
        //         body = Text("No more Data");
        //       }
        //       return Container(
        //         height: 55.0,
        //         child: Center(child:body),
        //       );
        //     },
        //   ),
        //   controller: _refreshController,
        //   onRefresh: _onRefresh,
        //   onLoading: _onLoading,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * (7 / 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: InkWell(
                        onTap: () {
                          refresh();
                        },
                        child: Icon(
                          Icons.autorenew,
                        )),
                  ),
                  Center(child: Text('Sing-Off')),
                  Container(
                    child: InkWell(
                        onTap: () {
                          changeFeed(false);
                          changeSongs(true);
                        },
                        child: Icon(
                          Icons.music_video,
                        )),
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height / 1.1,
            margin: EdgeInsets.only(top: 8),
            color: Colors.grey[800],
            child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: allVideos.map((element) {
                      return Container(
                          color: Colors.black38,
                          // margin: EdgeInsets.only(bottom: 1, top: 1),
                          child: InkWell(
                              onTap: () {
                                setFilePathToPlay(element.downloadURL);
                                changePlayer(true);
                                changeFeed(false);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 350,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        // padding: EdgeInsets.symmetric(
                                        // vertical: 1, horizontal: 1),
                                        child: Text(element.score.toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              backgroundColor:
                                                  Colors.black.withOpacity(0.5),
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
                                        image: new AssetImage(
                                            element.image.toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width:
                                    //     MediaQuery.of(context).size.width / 1.5,
                                    // padding: EdgeInsets.only(left: 3, right: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(element.title,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Text(element.artist,
                                            style:
                                                TextStyle(color: Colors.grey)),
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
          )
        ]));
  }
}
