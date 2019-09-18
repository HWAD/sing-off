import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:wave_progress_widget/wave_progress.dart';

class WaveAnimation extends StatelessWidget {
  final List<int> decibels;

  WaveAnimation(this.decibels);

  decibelToDouble(dec) {
    return dec.toDouble() - 40;
  }

  @override
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 9999.9),
      cycles: 0,
      builder: (anim) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              WaveProgress(180.0, Colors.blue, Colors.green,
                  decibels.length > 0 ? decibelToDouble(decibels.last) : 0),
            ],
          ),
        ),
      ),
    );
  }
}

/*
*/
