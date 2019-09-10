import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final List<String> score;

  Score([this.score = const []]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: score
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    // Image.asset('assets/food.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
