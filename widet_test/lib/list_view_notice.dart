import 'package:flutter/material.dart';
import 'first_page.dart';

class ListViewNotice extends StatefulWidget {
  // final int value;
  final List listNotices;

  const ListViewNotice({Key? key, required this.listNotices}) : super(key: key);

  @override
  State<ListViewNotice> createState() => _ListViewNoticeState();
}

class _ListViewNoticeState extends State<ListViewNotice> {
  late List listNotices;

  @override
  void initState() {
    super.initState();
    // this.state = widget.value;

    this.listNotices = widget.listNotices;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: listItem.length, //並べたい要素の数を指定する
      itemCount: listNotices.length, //並べたい要素の数を指定する
      itemBuilder: (context, int index) {
        // index はこの ListView における要素の番号
        return Center(
            child: GestureDetector(
          onTap: () {
            print('押しちゃったわ_ $index');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FirstPage('$index')));
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
    );
  }
}
