import 'package:flutter/material.dart';
import 'list_view.dart';

class TabNotice extends StatefulWidget {
  const TabNotice({super.key});

  @override
  State<TabNotice> createState() => _TabNoticeState();
}

class _TabNoticeState extends State<TabNotice> {
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
            Center(child: Text("お知らせ")),
            Center(
                child: MyListView(
              value: 10,
            ))
          ],
        ),
      ),
    );
  }
}






// Center(child: Text("お知らせ")),
//               Center(child: MyListView()),