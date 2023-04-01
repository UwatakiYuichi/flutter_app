import 'package:flutter/foundation.dart';

import 'package:riverpod/riverpod.dart';

class CountRiverpod extends StateNotifier<int> {
  CountRiverpod() : super(0);
  void changeState(state) => this.state = state;

  void incrementCounter() => this.state = this.state += 2;
}
