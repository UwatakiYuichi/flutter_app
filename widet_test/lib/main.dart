import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widet_test/common/indicator.dart';
import 'package:widet_test/common/widget/network_widget.dart';
import 'package:widet_test/home/home.dart';
import 'package:widet_test/river_pod/sample_provider.dart';
import 'package:widet_test/river_pod/sample_riverpod.dart';
import 'my_parts.dart';
import 'rock_parts.dart';
import 'common/common_footer.dart';
import 'home/carousel_slider.dart';

import 'home_page.dart';
import 'notice.dart';
import 'mypage.dart';
import 'exhibit.dart';
import 'grid_view.dart';
import 'grid_view_extent.dart';
import 'grid_view_builder.dart';
import 'list_view.dart';
import 'tab_test.dart';

import 'stack_test.dart';

import 'test_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'river_pod/count_river_pod.dart';

// お知らせ(タブ含む)
import 'notice/tab_notice.dart';
// youtube関連
import 'youtube/youtube_player.dart';
import 'youtube/youtube_playlist.dart';

// 通信用

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'ようこそ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// フッター関連
  // 選択したフッター番号
  int selectedIndex = 0;

  List<AppBar> appBarList = [
    AppBar(),
    AppBar(
      title: Text('お知らせ一覧'),
      centerTitle: true,
    ),

// AppBar(
//       title: Text('お知らせ一覧'),
//       centerTitle: true,
//     ),

    AppBar(
      title: Text('Youtube動画再生'),
      centerTitle: true,
      leading: Icon(Icons.menu),
    ),
    AppBar(
      title: Text('Provider'),
      centerTitle: true,
      actions: [Icon(Icons.add), Icon(Icons.clear)],
    ),
    AppBar(
      title: Text('Riverpod'),
      centerTitle: true,
      elevation: 0,
    ),
    AppBar(
      title: Text('6,色を変える'),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    AppBar(
      title: Text('7,画像を表示する'),
      centerTitle: true,
      flexibleSpace: Image.network(
        'https://sozaino.site/wp-content/uploads/2021/10/mahou32-1280x720.png',
        fit: BoxFit.cover,
      ),
    ),
    AppBar(
      title: Text('8,高さを変える'),
      centerTitle: true,
      toolbarHeight: 150,
    ),
  ];

  List<Widget> display = [
    // ApiTest(),
    Home(),
    TabNotice(),
    YoutubePlaylist(),
    SampleProvider(),
    SampleRiverpod()
  ];

  int _counter = 0;

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(selectedIndex),
        // body: display[selectedIndex],

        body: Stack(
          children: [
            Container(color: Color.fromARGB(255, 54, 158, 244)),
            display[selectedIndex],
            NetworkWidget()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'ホーム',
                backgroundColor: Color.fromARGB(255, 123, 131, 242)),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'お知らせ'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: '動画'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'Provider'),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Riverpod'),
          ],
          // 現在選択されているフッターメニューのインデックス
          currentIndex: selectedIndex,
          // フッター領域の影
          elevation: 0,
          // フッターメニュータップ時の処理
          onTap: (int index) {
            selectedIndex = index;
            setState(() {});
          },
          // 選択中フッターメニューの色
          fixedColor: Color.fromARGB(255, 0, 26, 255),
        ));
  }

  PreferredSizeWidget? getAppBar(int index) {
    if (index > 0) {
      return appBarList[index];
    }
    return null;
  }
}
