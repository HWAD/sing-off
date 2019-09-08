import 'package:flutter/material.dart';
//
  class SongCard {
    final String id;
    final String title;
    final String artist;
    final double duration;
    final String image;
    final DateTime date;

    SongCard(
        {@required this.id,
        @required this.title,
        @required this.artist,
        @required this.image,
        @required this.duration,
        @required this.date});
  }

class Menu extends StatelessWidget {
  // final List<String> menu;

  // Menu([this.menu = const []]);

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: menu
  //         .map((element) => Card(
  //               child: Column(
  //                 children: <Widget>[
  //                   // Image.asset('assets/food.jpg'),
  //                   Text(element)
  //                 ],
  //               ),
  //             ))
  //         .toList(),
  //   );
  // }


  final List<SongCard> songlist = [
    SongCard(
        id: "t1",
        title: "aasdfkasdl;jf;liasdgjoi;",
        artist: "Steppico1",
        image: 'assets/steppico.jpeg',
        duration: 2.60,
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle2",
        artist: "Steppico2",
        image: 'assets/steppico.jpeg',
        duration: 2.61,
        date: DateTime.now()),
    SongCard(
        id: "t1",
        title: "SongTitle3",
        artist: "Steppico3",
        image: 'assets/steppico.jpeg',
        duration: 2.60,
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle4",
        artist: "Steppico4",
        image: 'assets/steppico.jpeg',
        duration: 2.61,
        date: DateTime.now()),
    SongCard(
        id: "t1",
        title: "SongTitle5",
        artist: "Steppico5",
        image: 'assets/steppico.jpeg',
        duration: 2.60,
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle6",
        artist: "Steppico6",
        image: 'assets/steppico.jpeg',
        duration: 2.61,
        date: DateTime.now()),
        SongCard(
        id: "t1",
        title: "SongTitle7",
        artist: "Steppico7",
        image: 'assets/steppico.jpeg',
        duration: 2.60,
        date: DateTime.now()),
    SongCard(
        id: "t2",
        title: "SongTitle8",
        artist: "Steppico8",
        image: 'assets/steppico.jpeg',
        duration: 2.61,
        date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  'Song Menu',
                  style: TextStyle(fontSize: 20),
                ),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (String value) {
                      //   titleInput = value;
                      // },
                    ),
                    FlatButton(
                      child: Text('Search'),
                      textColor: Colors.purple,
                      onPressed: () {
                        print('Searching');
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    children: songlist.map((element) {
                      return Card(
                          child: InkWell(
                              onTap: () {
                                print('play this song!');
                              },
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 60,
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1, horizontal: 1),
                                        child: Text(element.duration.toString(),
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
                                        image: new AssetImage(
                                            'assets/steppico.jpeg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(element.title.toString(),
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
                              
                                    //not necessary unless songtitle string length is less than some value: I'm going to pad the string instead
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      // mainAxisSize: MainAxisSize.max,
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FlatButton(
                                          child:
                                              Text('Favorite', style: TextStyle()),
                                          textColor: Colors.blue,
                                          onPressed: () {
                                            print(
                                                'I just added this to favorites!');
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )));
                    }).toList(),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}

}
