import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MenuRow extends StatelessWidget {
  final Function setCategory;
  final Function changeMenu;
  final Function changeCategory;
  MenuRow(this.setCategory, this.changeMenu, this.changeCategory);

  final List items = ['Hip Hop', 'Rock', 'Christmas', 'Video'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
            Container(
              color: Colors.black,
              child:Row(
          children: [
            Container(
              height: 30,
              child: InkWell(
                  onTap: () {
                    changeCategory(true);
                    changeMenu(false);
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
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),),
        Container(
          height: 110,
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: ListView(scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              // primary: false,
              // padding: const EdgeInsets.all(10),
              // crossAxisCount: 2,
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
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
                              Text("Christmas", style: TextStyle(fontSize: 18)),
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
                              Text("Hip Hop", style: TextStyle(fontSize: 18)),
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
                          child: Text("Pop", style: TextStyle(fontSize: 18)),
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
                          child: Text("Rock", style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    )),
              ]),
        )
      ]),
    );
  }
}
