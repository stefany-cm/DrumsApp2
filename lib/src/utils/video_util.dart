import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoUtil extends StatefulWidget {

  final String url;
  VideoUtil(this.url) : super();

  @override
  _VideoUtilState createState() => _VideoUtilState();
}

class _VideoUtilState extends State<VideoUtil> {


  YoutubePlayerController _controller;
  
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        autoPlay: false,
      )
    );

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),

            ],
          ),
        ),
    );
  }
}