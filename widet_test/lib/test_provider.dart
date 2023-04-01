import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'river_pod/count_river_pod.dart';

final CounterProvider = ChangeNotifierProvider((ref) => Counter());

final countRiverpod =
    StateNotifierProvider<CountRiverpod, int>((ref) => CountRiverpod());

class Counter extends ChangeNotifier {
  var _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
