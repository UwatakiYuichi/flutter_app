import 'package:flutter/material.dart';
import 'list_view.dart';

class TabTest extends StatefulWidget {
  const TabTest({super.key});

  @override
  State<TabTest> createState() => _TabTestState();
}

class _TabTestState extends State<TabTest> {
  List tbl = [
    {
      "title": "特典獲得のお知らせ",
      "time": "2023/04/02 11:26",
      "summary": "特典獲得条件に該当するためお知らせをさせていただきます。",
    }
  ];

// 別の所で初期化するよ
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 6,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("タブ一覧"),
                  bottom: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      unselectedLabelStyle: TextStyle(fontSize: 12.0),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.camera_alt),
                          text: "カメラ",
                        ),
                        Tab(
                          icon: Icon(Icons.image),
                          text: "イメージ",
                        ),
                        Tab(icon: Icon(Icons.account_box), text: "ボックス"),
                        Tab(
                            icon: Icon(Icons.smart_display_outlined),
                            text: "tab1"),
                        Tab(
                            icon: Icon(Icons.add_home_work_sharp),
                            text: "tab2"),
                        Tab(icon: Icon(Icons.microwave_outlined), text: "tab3"),
                      ]),
                ),
                body: const TabBarView(children: [
                  Center(child: Text("Camera's tab")),
                  Center(child: Text("Document's tab")),
                  Center(
                      child: MyListView(
                    value: 2,
                  )),
                  Center(child: Text("tab1")),
                  Center(child: Text("tab2")),
                  Center(child: Text("tab3")),
                ]))));
  }
}
