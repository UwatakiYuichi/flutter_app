import 'package:flutter/cupertino.dart';
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

  late List _listSample = [];

  // 非同期で待機する
  Future<List> _getContents() async {
    await Future.delayed(const Duration(seconds: 1));

    List arr = [];
    for (int i = 0; i < 10; i++) {
      arr.add({
        "title": "追加お知らせ",
        "time": "2023/04/03 10:26",
        "summary": "お知らせ\n詳細詳細詳細詳細詳細詳細詳細詳細詳細詳細詳細",
      });
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getContents(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CupertinoActivityIndicator();
          }
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          if (snapshot.hasData) {
            _listSample.addAll(snapshot.data);
            return InfinityListView(
                contents: _listSample, getContents: _getContents);
          } else {
            return Text("データがありません");
          }
        });
  }
}

class InfinityListView extends StatefulWidget {
  final List contents;
  final Future<List> Function() getContents;
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
        setState(() {
          _isLoading = true;
        });

        var addData = await widget.getContents();

        widget.contents.addAll(addData);

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
    return Stack(
      children: [
        Scrollbar(
            isAlwaysShown: true,
            child: ListView.builder(
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
                        title: Text(
                            widget.contents[index]['title'] + index.toString()),
                        subtitle: Text(widget.contents[index]['time']),
                        leading: Image.network(
                            'https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
                        trailing: Icon(Icons.arrow_right_alt_sharp),
                      )),
                ));
              },
            )),
        _isLoading
            ? Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(30),
                child: CupertinoActivityIndicator(),
              )
            : Container()
      ],
    );
  }
}
