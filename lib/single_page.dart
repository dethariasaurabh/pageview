import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'main.dart';

class SinglePage extends StatefulWidget {

  final int index;
  final Map<int, String> videos;

  const SinglePage(this.index, this.videos, {Key? key}) : super(key: key);

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videos.values.elementAt(widget.index))..initialize();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.videos[currentIndex] == videoPlayerController.dataSource) {
      videoPlayerController.play();
    } else {
      videoPlayerController.pause();
    }

    return Container(
      color: currentIndex % 2 == 0 ? Colors.red : Colors.amber,
      child: Center(
        child: VideoPlayer(
            videoPlayerController
        ),
      ),
    );
  }
}