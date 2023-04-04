import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeDetail extends StatefulWidget {
  final dynamic objNotice;
  const NoticeDetail({Key? key, required this.objNotice}) : super(key: key);

  @override
  State<NoticeDetail> createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  late dynamic notice;
  @override
  void initState() {
    super.initState();
    this.notice = widget.objNotice;

    print(this.notice['summary']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("お知らせ詳細")),
        body: Center(
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(255, 205, 228, 206),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    this.notice['title'],
                    style: TextStyle(color: Color.fromARGB(255, 0, 100, 163)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    this.notice['time'],
                    style: TextStyle(color: Color.fromARGB(255, 84, 84, 84)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    this.notice['summary'],
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2,
                      children: const [
                        TextSpan(
                            text: 'Flutter',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        TextSpan(
                            text: 'ラボ',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        TextSpan(
                            text: 'は あらゆる角度から', style: TextStyle(fontSize: 18)),
                        TextSpan(
                            text: 'Flutter',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        TextSpan(
                            text: 'が学べるサービスです', style: TextStyle(fontSize: 18)),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
