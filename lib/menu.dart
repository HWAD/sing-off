import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List<String> menu;

  Menu([this.menu = const []]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menu
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
