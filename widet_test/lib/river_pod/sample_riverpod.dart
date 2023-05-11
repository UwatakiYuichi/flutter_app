import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleRiverpod extends StatefulWidget {
  const SampleRiverpod({super.key});

  @override
  State<SampleRiverpod> createState() => _SampleRiverpodState();
}

class _SampleRiverpodState extends State<SampleRiverpod> {
  @override
  Widget build(BuildContext context) {
    // 共有したいProviderを設定する
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>(
            create: (context) => CountProvider(),
          ),
        ],
        child: Column(
          children: [MainWidget(), SubWidget()],
        ));
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CountProvider countProvider =
        Provider.of<CountProvider>(context, listen: true);

    return Container(
        alignment: Alignment(0, 0),
        color: Colors.green,
        child: Column(
          children: [
            Text("メインウィジェット"),
            Text("${countProvider.counter}"),
            ElevatedButton(
                onPressed: () {
                  countProvider.incrementCounter();
                },
                child: Text("メイン"))
          ],
        ));
  }
}

class SubWidget extends StatelessWidget {
  const SubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CountProvider countProvider =
        Provider.of<CountProvider>(context, listen: true);
    return Container(
        width: double.infinity,
        height: 400,
        color: Color.fromARGB(255, 175, 76, 135),
        child: Column(children: [
          Text("サブウィジェット"),
          Text("${countProvider.counter}"),
          ElevatedButton(
              onPressed: () {
                countProvider.incrementCounterValue(5);
              },
              child: Text("サブ"))
        ]));
  }
}

class CountProvider with ChangeNotifier {
  // 今回状態管理をする変数
  int counter = 0;
  //状態を変化させる処理（ボタンを押した時に実行される処理）
  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void incrementCounterValue(int value) {
    counter += value;
    notifyListeners();
  }
}

class Work {
  void telework() => print('テレワーク');
  void workplaceWork() => print('職場ワーク');
}

// 練習用
class ParamsProvider with ChangeNotifier, Work {
  int _age = 0;
  // アンダースコアでprivateになる
  String _name = "";

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }

  void SetName(String name) {
    _name = name;
    // 画面再描画を通知する
    notifyListeners();
  }
}
