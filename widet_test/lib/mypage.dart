import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'test_provider.dart';

class MyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var countProvider = ref.watch(CounterProvider);

    var cntRiverpod = ref.watch(countRiverpod);

    // TODO: implement build
    return Container(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            children: [
              Text(countProvider.count.toString()),
              Text(ref.watch(countRiverpod).toString()),
              ElevatedButton(
                  onPressed: () {
                    countProvider.increment();

                    ref.read(countRiverpod.notifier).incrementCounter();
                  },
                  child: Text("マイページ"))
            ],
          ),
        ));
  }
}
