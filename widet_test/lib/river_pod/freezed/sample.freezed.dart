// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Sample {
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SampleCopyWith<Sample> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleCopyWith<$Res> {
  factory $SampleCopyWith(Sample value, $Res Function(Sample) then) =
      _$SampleCopyWithImpl<$Res, Sample>;
  @useResult
  $Res call({String name, int age, bool isEnabled});
}

/// @nodoc
class _$SampleCopyWithImpl<$Res, $Val extends Sample>
    implements $SampleCopyWith<$Res> {
  _$SampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? isEnabled = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SampleCopyWith<$Res> implements $SampleCopyWith<$Res> {
  factory _$$_SampleCopyWith(_$_Sample value, $Res Function(_$_Sample) then) =
      __$$_SampleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int age, bool isEnabled});
}

/// @nodoc
class __$$_SampleCopyWithImpl<$Res>
    extends _$SampleCopyWithImpl<$Res, _$_Sample>
    implements _$$_SampleCopyWith<$Res> {
  __$$_SampleCopyWithImpl(_$_Sample _value, $Res Function(_$_Sample) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? isEnabled = null,
  }) {
    return _then(_$_Sample(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Sample implements _Sample {
  const _$_Sample(this.name, this.age, this.isEnabled);

  @override
  final String name;
  @override
  final int age;
  @override
  final bool isEnabled;

  @override
  String toString() {
    return 'Sample(name: $name, age: $age, isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sample &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, age, isEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SampleCopyWith<_$_Sample> get copyWith =>
      __$$_SampleCopyWithImpl<_$_Sample>(this, _$identity);
}

abstract class _Sample implements Sample {
  const factory _Sample(
      final String name, final int age, final bool isEnabled) = _$_Sample;

  @override
  String get name;
  @override
  int get age;
  @override
  bool get isEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_SampleCopyWith<_$_Sample> get copyWith =>
      throw _privateConstructorUsedError;
}
