import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import './freezed/mydata.dart';

final _mydataProvider = StateNotifierProvider<MyDataStateNotifier, MyData>(
    (ref) => MyDataStateNotifier());

class SampleRiverpod extends StatefulWidget {
  const SampleRiverpod({super.key});

  @override
  State<SampleRiverpod> createState() => _SampleRiverpodState();
}

class _SampleRiverpodState extends State<SampleRiverpod> {
  @override
  Widget build(BuildContext context) {
    // 共有したいProviderを設定する
    return Column(
      children: [
        MainWidget(),
        MainWidget(),
      ],
    );
  }
}

class MainWidget extends HookConsumerWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyData mydataWatch = ref.watch(_mydataProvider);
    MyDataStateNotifier mydataNotifier = ref.read(_mydataProvider.notifier);

    return Container(
        alignment: Alignment(0, 0),
        color: Colors.green,
        child: Column(
          children: [
            Text("メインウィジェット"),
            Text("${mydataWatch.value}"),
            Text("${mydataWatch.isEnable}"),
            ElevatedButton(
                onPressed: () {
                  mydataNotifier.changeIsEnable(true);
                  mydataNotifier.changeState(mydataWatch.value + 2);
                },
                child: Text("メイン"))
          ],
        ));
  }
}
