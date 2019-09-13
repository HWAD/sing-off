import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MenuSearch extends StatelessWidget {
  final Function setCategory;
  MenuSearch(this.setCategory);
  final List items = ['Hip Hop', 'Rock', 'Christmas', 'Genius', 'Video'];

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
                  'Category',
                  style: TextStyle(fontSize: 20),
                ),
                elevation: 5,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: items.map((element) {
                  return Container(
                    padding: EdgeInsets.only(top: 2),
                    margin: EdgeInsets.only(top: 3),
                    child: InkWell(
                      onTap: () {
                        setCategory(element);
                      },
                      child: Text(element),
                    ),
                  );
                }).toList()),
          ]),
          
    );
  }
}
