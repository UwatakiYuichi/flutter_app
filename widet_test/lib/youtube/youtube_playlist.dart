import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube/youtube.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_api/youtube_api.dart';
import '../river_pod/freezed/mydata.dart';
import '../river_pod/my_data_state_notifier.dart';
import './youtube_player.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../river_pod/my_data_state_notifier.dart';

class YoutubePlaylist extends StatefulWidget {
  const YoutubePlaylist({super.key});

  @override
  State<YoutubePlaylist> createState() => YoutubePlaylistState();
}

class YoutubePlaylistState extends State<YoutubePlaylist> {
  int max = 25;

  String apiKey = "AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ";
  String type = "channel";

  static String key = 'AIzaSyCTYTR7JOPaR1aWKU1PNXPDblJK8h6cbCQ';
  YoutubeAPI youtube = new YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

  @override
  void initState() {
    super.initState();

    // callAPI('水星の魔女');
  }

  // youtube動画情報の取得
  Future<void> callAPI(String query) async {
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();

    for (int i = 0; i < videoResult.length; i++) {
      var youTubeVideo = videoResult[i];
      print(youTubeVideo.url);
      print(youTubeVideo.thumbnail.small.url);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: videoResult.map<Widget>(listItem).toList(),
    // );
    return ListYoutubeVideo();
  }

  Widget listItem(YouTubeVideo video) {
    return Card(
        child: GestureDetector(
      onTap: () {
        print("押したわよ");

        print(video);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => YoutubeDetailPlayer(video: video)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(""),

// child: Image.network(
//                 video.thumbnail.small.url ?? '',
//                 width: 120.0,
//               ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    video.title,
                    softWrap: true,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    child: Text(
                      video.channelTitle,
                      softWrap: true,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    video.url,
                    softWrap: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

/*
 * Youtube動画一覧 
 */
class ListYoutubeVideo extends HookConsumerWidget {
  const ListYoutubeVideo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyData ungData = ref.watch(uniqueDataProvider);
    MyDataStateNotifier uniqueNotifier = ref.read(uniqueDataProvider.notifier);

    final state = useState(0);

    List<YouTubeVideo> videoResult = [];

    final count = useState(0);
    final listYoutbe = useState<List<YouTubeVideo>>([]);
    final listString = useState<List<String>>([]);

    useEffect(
      () {
        // 初回マウント時に１回だけ実行される
        uniqueNotifier.searchYoutubeMovieList("flutter 入門",
            (List<YouTubeVideo> result) {
          print("##通信終了##");

          final newYoutubeList = listYoutbe.value;

          result.forEach((element) {
            newYoutubeList.add(element);
          });

          listYoutbe.value = [...newYoutubeList];
        });

        return () {/* dispose時に行いたい処理があればここに記載する */};
      },
      // 以下の値に変化があったときに再実行される。
      // この例ではマウント時にのみ実行される。
      [],
    );

    Widget listItem(YouTubeVideo video) {
      return Card(
          child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => YoutubeDetailPlayer(video: video)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          padding: EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(""),

// child: Image.network(
//                 video.thumbnail.small.url ?? '',
//                 width: 120.0,
//               ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      video.title,
                      softWrap: true,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        video.channelTitle,
                        softWrap: true,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      video.url,
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }

    return ListView(
      children: listYoutbe.value.map<Widget>(listItem).toList(),
    );
  }
}
