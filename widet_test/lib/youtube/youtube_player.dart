import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const List<String> _videoIds = [
  'IHo-Bjq7yWE',
  'a6wG03d1xFU&list=RDMMa6wG03d1xFU&start_radio=1',
];

class YoutubePlayer extends StatefulWidget {
  const YoutubePlayer({super.key});

  @override
  State<YoutubePlayer> createState() => YoutubePlayerState();
}

class YoutubePlayerState extends State<YoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: false,
        playsInline: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener(
      (isFullScreen) {},
    );

    _controller.loadPlaylist(
      list: _videoIds,
      listType: ListType.playlist,
      startSeconds: 136,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
        builder: (context, player) {
          return Column(
            children: [
              player,
              ElevatedButton(
                  onPressed: () {
                    _controller.playVideo();
                  },
                  child: Icon(Icons.play_arrow)),
              ElevatedButton(
                  onPressed: () {
                    _controller.pauseVideo();
                  },
                  child: Icon(Icons.pause)),
              ElevatedButton(
                  onPressed: () {
                    _controller.stopVideo();
                  },
                  child: Icon(Icons.stop)),
            ],
          );
        },
        aspectRatio: 16 / 9,
        controller: _controller);
  }
}
