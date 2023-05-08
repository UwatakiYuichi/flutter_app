import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class SampleProvider extends StatefulWidget {
  const SampleProvider({super.key});

  @override
  State<SampleProvider> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SampleProvider> {
  @override
  Widget build(BuildContext context) {
    // 共有したいProviderを設定する
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>(
            create: (contex) => CountProvider(),
          ),
          ChangeNotifierProvider<ParamsProvider>(
            create: (context) => ParamsProvider(),
          )
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

    final ParamsProvider paramsProvider =
        Provider.of<ParamsProvider>(context, listen: true);

    return Container(
        alignment: Alignment(0, 0),
        color: Colors.green,
        child: Column(
          children: [
            Text("メインウィジェット"),
            Text(("!!cnt_ ${countProvider.counter}")),
            ElevatedButton(
                onPressed: () {
                  countProvider.incrementCounter();
                },
                child: Text("カウントアップ!")),
            Text("メインウィジェット"),
            SizedBox(
              height: 20,
            ),
            Text(("!!name_ ${paramsProvider._name}")),
            ElevatedButton(
                onPressed: () {
                  paramsProvider.SetName("ネオユニヴァース");
                },
                child: Text("名前を設定_メイン!"))
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

    final ParamsProvider paramsProvider =
        Provider.of<ParamsProvider>(context, listen: true);

    return Container(
        width: double.infinity,
        height: 400,
        color: Color.fromARGB(255, 175, 76, 135),
        child: Column(
          children: [
            Text("サブウィジェット"),
            Text(("!!cnt_ ${countProvider.counter}")),
            ElevatedButton(
                onPressed: () {
                  countProvider.incrementCounterValue(2);
                },
                child: Text("カウントアップ!")),
            SizedBox(
              height: 20,
            ),
            Text(("!!name_ ${paramsProvider._name}")),
            ElevatedButton(
                onPressed: () {
                  paramsProvider.SetName("ライスシャワー!!");
                },
                child: Text("名前を設定_サブ!"))
          ],
        ));
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
