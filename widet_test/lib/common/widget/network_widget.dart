import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:widet_test/common/indicator.dart';

import '../../river_pod/freezed/mydata.dart';
import '../../river_pod/my_data_state_notifier.dart';

// import 'my_data_state_notifier.dart';
// 通信処理用のUIウィジェット
class NetworkWidget extends HookConsumerWidget {
  const NetworkWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyData ungData = ref.watch(uniqueDataProvider);
    MyDataStateNotifier uniqueNotifier = ref.read(uniqueDataProvider.notifier);

    return Container(
        alignment: Alignment(0, 0),
        color: Colors.green,
        child: Column(
          children: [
            Text("メインウィジェット"),
            Text("通信中"),
            ungData.isEnable ? MyIndicator() : Container()
          ],
        ));
  }
}
