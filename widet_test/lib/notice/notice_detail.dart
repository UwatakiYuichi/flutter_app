import 'package:flutter/material.dart';

class NoticeDetail extends StatefulWidget {
  final Object objNotice;
  const NoticeDetail({Key? key, required this.objNotice}) : super(key: key);

  @override
  State<NoticeDetail> createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  late Object notice;
  @override
  void initState() {
    super.initState();
    this.notice = widget.objNotice;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
