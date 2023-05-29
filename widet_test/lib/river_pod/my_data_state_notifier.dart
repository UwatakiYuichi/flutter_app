import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import './freezed/mydata.dart';

// 一回のみ実行される
final uniqueDataProvider = StateNotifierProvider<MyDataStateNotifier, MyData>(
    (ref) => MyDataStateNotifier());
