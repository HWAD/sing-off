import 'package:flutter/material.dart';
import './user_page_options.dart';
import './user_page_videos.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        UserPageOptions(),
        UserPageVideos(),
      ],
    );
  }
}
