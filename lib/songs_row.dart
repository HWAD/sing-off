import 'package:flutter/material.dart';

class SongRow extends StatelessWidget {
  final Function setCategory;
  final Function changeSongs;
  final Function changeCategory;
  SongRow(this.setCategory, this.changeSongs, this.changeCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Container(
          color: Colors.black,
          child: Row(
            children: [
              Container(
                height: 30,
                child: InkWell(
                    onTap: () {
                      changeCategory(true);
                      changeSongs(false);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    )),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 20, left: 50),
                child: Text(
                  'Genre',
                  style: TextStyle(fontSize: 18,
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
      ),]),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 110,
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: ListView(scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(),
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/christmas.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Christmas");
                        },
                        child: Center(
                          child:
                              Text("Christmas", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
                Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/drake.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Hip Hop");
                        },
                        child: Center(
                          child:
                              Text("Hip Hop", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
                Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/pop.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Pop");
                        },
                        child: Center(
                          child: Text("Pop", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
                Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/bruce.jpg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Rock", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
                    Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/country.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Country", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
                    Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/soul.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Soul", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
                    Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 7),
                    child: Ink.image(
                      image: AssetImage("assets/bey.jpeg"),
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {
                          setCategory("Rock");
                        },
                        child: Center(
                          child: Text("Bey", style: TextStyle(fontSize: 18,
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
      ),])),
                        ),
                      ),
                    )),
              ]),
        )
      ]),
    );
  }
}