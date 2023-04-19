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

class YoutubePlayer extends StatefulWidget {
  const YoutubePlayer({super.key});

  @override
  State<YoutubePlayer> createState() => YoutubePlayerState();
}

class YoutubePlayerState extends State<YoutubePlayer> {
  late YoutubePlayerController _controller;

  int max = 25;

  String apiKey = "AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ";
  String type = "channel";

  static String key = 'AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ';
  YoutubeAPI youtube = new YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    String query = "水星の魔女";
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();

    print("----結果----");
    print(videoResult.length);

    for (int i = 0; i < videoResult.length; i++) {
      var youTubeVideo = videoResult[i];
      print(youTubeVideo.url);
      print(youTubeVideo.thumbnail.small.url);
    }
    setState(() {});
  }

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

    // youtubeAPIを
    callAPI();
    print('hello');
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
                YoutubeThumbnail(youtubeId: 'IHo-Bjq7yWE').small(),
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
