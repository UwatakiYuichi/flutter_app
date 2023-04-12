import 'package:flutter/material.dart';
import 'list_view.dart';
import 'list_view_notice.dart';

class TabNotice extends StatefulWidget {
  const TabNotice({super.key});

  @override
  State<TabNotice> createState() => _TabNoticeState();
}

class _TabNoticeState extends State<TabNotice> {
  List notices = [
    {
      "title": "特典獲得のお知らせ",
      "time": "2023/04/02 11:26",
      "summary": "特典獲得条件に該当するためお知らせをさせていただきます。",
    },
    {
      "title": "大型アップデートのお知らせ",
      "time": "2023/04/03 10:26",
      "summary": "この度、大型アップデート対応により以下機能を追加いたしましたためお知らせさせていただきます\n※詳細はこちら\n",
    }
  ];

  List noticesNews = [
    {
      "title": "ニュースのお知らせ",
      "time": "2023/04/02 11:26",
      "summary": "特典獲得条件に該当するためお知らせをさせていただきます。",
    },
    {
      "title": "サービス終了のお知らせ",
      "time": "2023/04/03 10:26",
      "summary": "この度、大型アップデート対応により以下機能を追加いたしましたためお知らせさせていただきます\n※詳細はこちら\n",
    },
    {
      "title": "今後の運営方針についてのお知らせ",
      "time": "2023/04/03 10:26",
      "summary": "この度、大型アップデート対応により以下機能を追加いたしましたためお知らせさせていただきます\n※詳細はこちら\n",
    }
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 90, 90).withOpacity(0.5),
          elevation: 0.0,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.notifications),
                text: 'お知らせ',
              ),
              Tab(
                icon: Icon(Icons.newspaper),
                text: 'ニュース',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: ListViewNotice(listNotices: notices)),
            Center(child: ListViewNotice(listNotices: noticesNews)),
          ],
        ),
      ),
    );
  }
}
