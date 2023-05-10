import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.freezed.dart';

@freezed
class Sample with _$Sample {
  const factory Sample(String name, int age, bool isEnabled) = _Sample;
}
