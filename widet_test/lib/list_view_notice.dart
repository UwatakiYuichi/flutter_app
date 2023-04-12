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
  late List listNotices;

  final List _listSample = [];

  // 非同期で待機する
  Future<void> _getContents() async {
    print("##ぼっちスタート");
    await Future.delayed(const Duration(seconds: 3));
    for (int i = 0; i < 10; i++) {
      _listSample.add({
        "title": "追加分ですよ",
        "time": "2023/04/03 10:26",
        "summary": "ヒャッハ〜\n",
      });
    }
    print("##ぼっちえんd");
    print(_listSample.length);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getContents(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("待機中");
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return InfinityListView(
              contents: _listSample, getContents: _getContents);
        });
  }
}

class InfinityListView extends StatefulWidget {
  final List contents;
  final Future<void> Function() getContents;
  const InfinityListView({
    Key? key,
    required this.contents,
    required this.getContents,
  }) : super(key: key);

  @override
  State<InfinityListView> createState() => _InfinityListViewState();
}

class _InfinityListViewState extends State<InfinityListView> {
  late ScrollController _scrollController;
  //6
  bool _isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >
              _scrollController.position.maxScrollExtent * 1 &&
          !_isLoading) {
        _isLoading = true;

        await widget.getContents();

        setState(() {
          _isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.contents.length, //並べたい要素の数を指定する
      itemBuilder: (context, int index) {
        return Center(
            child: GestureDetector(
          onTap: () {
            dynamic targetNotice = widget.contents[index];
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
                title: Text(widget.contents[index]['title'] + index.toString()),
                subtitle: Text(widget.contents[index]['time']),
                leading: Image.network(
                    'https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
                trailing: Icon(Icons.arrow_right_alt_sharp),
              )),
        ));
      },
    );
  }
}
