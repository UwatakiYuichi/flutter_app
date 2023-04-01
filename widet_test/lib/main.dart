import 'package:flutter/material.dart';
import 'my_parts.dart';
import 'rock_parts.dart';
import 'common_footer.dart';

import 'home_page.dart';
import 'notice.dart';
import 'mypage.dart';
import 'exhibit.dart';
import 'grid_view.dart';
import 'grid_view_extent.dart';
import 'grid_view_builder.dart';
import 'list_view.dart';
import 'tab_test.dart';

import 'carousel_slider.dart';
import 'stack_test.dart';

import 'test_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'river_pod/count_river_pod.dart';

import 'tab_notice.dart';

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

  int indexAppBar = 3;

  List<AppBar> appBarList = [
    AppBar(
      title: Text('1,ただのAppBar'),
    ),
    AppBar(
      title: Text('2,テキストを中央に表示'),
      centerTitle: true,
    ),
    AppBar(
      title: Text('3,左にアイコン'),
      centerTitle: true,
      leading: Icon(Icons.menu),
    ),
    AppBar(
      title: Text('4,右にアイコン'),
      centerTitle: true,
      actions: [Icon(Icons.add), Icon(Icons.clear)],
    ),
    AppBar(
      title: Text('5,影をなくす'),
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
    // HomePage(),
    StackTest(),
    // TabTest(),
    TabNotice(),
    Notice(),
    MyPage(),
    GriViewCount(),
    GriViewExtent(),
    GriViewBuilder(),

    MyCarousel()
  ];

  int _counter = 0;

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarList[indexAppBar],
        body: display[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'タブ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), label: 'お知らせ'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'マイページ'),
            BottomNavigationBarItem(icon: Icon(Icons.piano), label: 'グリッド(数)'),
            BottomNavigationBarItem(icon: Icon(Icons.piano), label: 'グリッド(幅)'),
            BottomNavigationBarItem(
                icon: Icon(Icons.picture_as_pdf), label: 'グリッド(可変)'),
            BottomNavigationBarItem(icon: Icon(Icons.museum), label: 'リストビュー'),
            BottomNavigationBarItem(icon: Icon(Icons.usb), label: 'カルーセル'),
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
}
