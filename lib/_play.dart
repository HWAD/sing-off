import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  final List<String> play;

  Play([this.play = const []]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: play
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
