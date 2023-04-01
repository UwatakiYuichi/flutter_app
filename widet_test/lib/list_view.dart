import 'package:flutter/material.dart';
import 'first_page.dart';

class MyListView extends StatefulWidget {
  final int value;
  const MyListView({Key? key, required this.value}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final listItem = List.generate(100, (i) => '$i');

  late int state;

  @override
  void initState() {
    super.initState();
    this.state = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listItem.length, //並べたい要素の数を指定する
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
                title: Text('no: $index'),
                subtitle: Text('ぼっちちゃん!. $index. $state'),
                leading: Image.network(
                    'https://pbs.twimg.com/media/ECkqHryUYAECPPH.png'),
                trailing: Icon(Icons.arrow_circle_right),
              )),
        ));
      },
    );
  }
}
