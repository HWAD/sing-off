import 'package:flutter/material.dart';

class SongSearch extends StatelessWidget {
  final Function setCategory;
  SongSearch(this.setCategory);
  final List items = ['Hip Hop', 'Rock', 'Christmas', 'Video'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                color: Colors.grey[700],
                child: AppBar(
                  backgroundColor: Colors.black,
                  title: Text('Sing-Off',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                elevation: 5,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*(8/10),
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget> [
                  Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/christmas.jpeg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Christmas");
                      },
                      child: Center(
                        child: Text("Christmas",
                        style: TextStyle(fontSize: 25,
                        shadows: [
                          Shadow( // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.black,
                            ),
                          Shadow( // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.black,
                          ),
                          Shadow( // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.black,
                          ),
                          Shadow( // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.black,
                          )],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                   Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/drake.jpeg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Hip Hop");
                      },
                      child: Center(
                        child: Text("Hip Hop",
                        style: TextStyle(fontSize: 25,
                        shadows: [
      Shadow( // bottomLeft
	offset: Offset(-1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // bottomRight
	offset: Offset(1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // topRight
	offset: Offset(1.5, 1.5),
	color: Colors.black
      ),
      Shadow( // topLeft
	offset: Offset(-1.5, 1.5),
	color: Colors.black
      ),
  ],)),
                        ),),)
                        ),
                   Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/pop.jpeg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Pop");
                      },
                      child: Center(
                        child: Text("Pop",
                        style: TextStyle(fontSize: 25,
                        shadows: [
      Shadow( // bottomLeft
	offset: Offset(-1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // bottomRight
	offset: Offset(1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // topRight
	offset: Offset(1.5, 1.5),
	color: Colors.black
      ),
      Shadow( // topLeft
	offset: Offset(-1.5, 1.5),
	color: Colors.black
      ),
  ],)),
                        ),),)
                        ),
                  Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/bruce.jpg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Rock");
                      },
                      child: Center(
                        child: Text(
                        "Rock",
                        style: TextStyle(fontSize: 25,
                        shadows: [
      Shadow( // bottomLeft
	offset: Offset(-1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // bottomRight
	offset: Offset(1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // topRight
	offset: Offset(1.5, 1.5),
	color: Colors.black
      ),
      Shadow( // topLeft
	offset: Offset(-1.5, 1.5),
	color: Colors.black
      ),
  ],)
                      ),),),)
                        ),
                        Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/country.jpeg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Rock");
                      },
                      child: Center(
                        child: Text(
                        "Country",
                        style: TextStyle(fontSize: 25,
                        shadows: [
      Shadow( // bottomLeft
	offset: Offset(-1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // bottomRight
	offset: Offset(1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // topRight
	offset: Offset(1.5, 1.5),
	color: Colors.black
      ),
      Shadow( // topLeft
	offset: Offset(-1.5, 1.5),
	color: Colors.black
      ),
  ],)
                      ),),),)
                        ),
                        Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/soul.jpeg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Rock");
                      },
                      child: Center(
                        child: Text(
                        "Soul",
                        style: TextStyle(fontSize: 25,
                        shadows: [
      Shadow( // bottomLeft
	offset: Offset(-1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // bottomRight
	offset: Offset(1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // topRight
	offset: Offset(1.5, 1.5),
	color: Colors.black
      ),
      Shadow( // topLeft
	offset: Offset(-1.5, 1.5),
	color: Colors.black
      ),
  ],)
                      ),),),)
                        ),
                        Container(
                        child: Ink.image(
                          image: AssetImage(
                              "assets/bey.jpeg"
                            ),
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                      onTap: () {
                        setCategory("Rock");
                      },
                      child: Center(
                        child: Text(
                        "Bey",
                        style: TextStyle(fontSize: 25,
                        shadows: [
      Shadow( // bottomLeft
	offset: Offset(-1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // bottomRight
	offset: Offset(1.5, -1.5),
	color: Colors.black
      ),
      Shadow( // topRight
	offset: Offset(1.5, 1.5),
	color: Colors.black
      ),
      Shadow( // topLeft
	offset: Offset(-1.5, 1.5),
	color: Colors.black
      ),
  ],)
                      ),),),)
                        ),
                ]),

            )
              ]),
    );
  }
}
