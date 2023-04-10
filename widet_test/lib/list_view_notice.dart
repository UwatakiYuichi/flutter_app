import 'package:flutter/material.dart';
import 'package:widet_test/common/indicator.dart';
import 'first_page.dart';
import 'dart:async';
import 'dart:io';
import 'notice/notice_detail.dart';

class ListViewNotice extends StatefulWidget {
  // final int value;
  final List listNotices;

  const ListViewNotice({Key? key, required this.listNotices}) : super(key: key);

  @override
  State<ListViewNotice> createState() => _ListViewNoticeState();
}

class _ListViewNoticeState extends State<ListViewNotice> {
  ScrollController _scrollController = ScrollController();
  late List listNotices;

  bool isInit = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // this.state = widget.value;

    this.listNotices = widget.listNotices;

    if (this.listNotices.length <= 10) {
      this.listNotices.add({
        "title": "エアリアル",
        "time": "2023/04/03 10:26",
        "summary": "水星の魔女\n",
      });
    }
  }

  // 非同期で待機する
  Future<String> asyncFunc(String name, int time) async {
    setState(() {
      isLoading = true;
    });
    return Future.delayed(Duration(seconds: time), () {
      print("終了");

      return name + ":" + DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Scrollbar(
            child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollNotification) {
                final before = notification.metrics.extentBefore;
                final max = notification.metrics.maxScrollExtent;
                if (!isLoading && before == max) {
                  setState(() {
                    isLoading = true;
                    for (int i = 0; i < 10; i++) {
                      this.listNotices.add({
                        "title": "ルブリス",
                        "time": "2023/04/03 10:26",
                        "summary": "エリクト\n",
                      });
                    }
                    isLoading = false;
                    print(this.listNotices.length);
                  });
                }
              }

              return false;
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: listNotices.length, //並べたい要素の数を指定する
              itemBuilder: (context, int index) {
                // index はこの ListView における要素の番号
                return Center(
                    child: GestureDetector(
                  onTap: () {
                    dynamic targetNotice = listNotices[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NoticeDetail(objNotice: targetNotice)));
                  },
                  onDoubleTap: () {
                    print("##ダブルタップ:$index");
                  },
                  onLongPress: () {
                    print("ロングプレス: %index");
                  },
                  child: Ink(
                      color: Colors.red.shade50,
                      child: ListTile(
                        title: Text(listNotices[index]['title']),
                        subtitle: Text(listNotices[index]['time']),
                        leading: Image.network(
                            'https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
                        trailing: Icon(Icons.arrow_right_alt_sharp),
                      )),
                ));
              },
            ),
          ))
        : MyIndicator();
  }
}
