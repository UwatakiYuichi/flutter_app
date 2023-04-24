import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube/youtube.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_api/youtube_api.dart';

const List<String> _videoIds = [
  'IHo-Bjq7yWE',
  'a6wG03d1xFU&list=RDMMa6wG03d1xFU&start_radio=1',
];

class YoutubeDetailPlayer extends StatefulWidget {
  // const YoutubeDetailPlayer({super.key});

  // ビデオI
  final YouTubeVideo video;

  const YoutubeDetailPlayer({Key? key, required this.video}) : super(key: key);

  // const NoticeDetail({Key? key, required this.objNotice}) : super(key: key);

  @override
  State<YoutubeDetailPlayer> createState() => YoutubeDetailPlayerState();
}

class YoutubeDetailPlayerState extends State<YoutubeDetailPlayer> {
  late YoutubePlayerController _controller;

  int max = 25;

  String apiKey = "AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ";
  String type = "channel";

  static String key = 'AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ';
  YoutubeAPI youtube = new YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

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

    String videoId = widget.video.id ?? '';
    List<String> videoIds = [videoId];

    print(videoId);

    // _controller.loadPlaylist(
    //   list: [videoId],
    //   listType: ListType.playlist,
    //   startSeconds: 136,
    // );

    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
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
              Image.network(
                YoutubeThumbnail(youtubeId: widget.video.id).small(),
                errorBuilder: (c, e, s) {
                  print('Load failed : ${c.toString()}');
                  return Text("ErrorImage");
                },
              )
            ],
          );
        },
        aspectRatio: 16 / 9,
        controller: _controller);
  }
}
