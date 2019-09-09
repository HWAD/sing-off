import 'package:flutter/material.dart';

class MenuSearch extends StatelessWidget {

  MenuSearch();

  final titleController = TextEditingController();

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
                'Let''s Search a new songs',
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
        ]
      ),
    );
  }
}
