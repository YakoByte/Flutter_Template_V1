// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy_data_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyHomePageState {
  DummyDataModel? get dummyDataModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyHomePageStateCopyWith<MyHomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyHomePageStateCopyWith<$Res> {
  factory $MyHomePageStateCopyWith(
          MyHomePageState value, $Res Function(MyHomePageState) then) =
      _$MyHomePageStateCopyWithImpl<$Res, MyHomePageState>;
  @useResult
  $Res call({DummyDataModel? dummyDataModel});

  $DummyDataModelCopyWith<$Res>? get dummyDataModel;
}

/// @nodoc
class _$MyHomePageStateCopyWithImpl<$Res, $Val extends MyHomePageState>
    implements $MyHomePageStateCopyWith<$Res> {
  _$MyHomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dummyDataModel = freezed,
  }) {
    return _then(_value.copyWith(
      dummyDataModel: freezed == dummyDataModel
          ? _value.dummyDataModel
          : dummyDataModel // ignore: cast_nullable_to_non_nullable
              as DummyDataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DummyDataModelCopyWith<$Res>? get dummyDataModel {
    if (_value.dummyDataModel == null) {
      return null;
    }

    return $DummyDataModelCopyWith<$Res>(_value.dummyDataModel!, (value) {
      return _then(_value.copyWith(dummyDataModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MyHomePageStateCopyWith<$Res>
    implements $MyHomePageStateCopyWith<$Res> {
  factory _$$_MyHomePageStateCopyWith(
          _$_MyHomePageState value, $Res Function(_$_MyHomePageState) then) =
      __$$_MyHomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DummyDataModel? dummyDataModel});

  @override
  $DummyDataModelCopyWith<$Res>? get dummyDataModel;
}

/// @nodoc
class __$$_MyHomePageStateCopyWithImpl<$Res>
    extends _$MyHomePageStateCopyWithImpl<$Res, _$_MyHomePageState>
    implements _$$_MyHomePageStateCopyWith<$Res> {
  __$$_MyHomePageStateCopyWithImpl(
      _$_MyHomePageState _value, $Res Function(_$_MyHomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dummyDataModel = freezed,
  }) {
    return _then(_$_MyHomePageState(
      dummyDataModel: freezed == dummyDataModel
          ? _value.dummyDataModel
          : dummyDataModel // ignore: cast_nullable_to_non_nullable
              as DummyDataModel?,
    ));
  }
}

/// @nodoc

class _$_MyHomePageState extends _MyHomePageState {
  _$_MyHomePageState({this.dummyDataModel}) : super._();

  @override
  final DummyDataModel? dummyDataModel;

  @override
  String toString() {
    return 'MyHomePageState(dummyDataModel: $dummyDataModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyHomePageState &&
            (identical(other.dummyDataModel, dummyDataModel) ||
                other.dummyDataModel == dummyDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dummyDataModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyHomePageStateCopyWith<_$_MyHomePageState> get copyWith =>
      __$$_MyHomePageStateCopyWithImpl<_$_MyHomePageState>(this, _$identity);
}

abstract class _MyHomePageState extends MyHomePageState {
  factory _MyHomePageState({final DummyDataModel? dummyDataModel}) =
      _$_MyHomePageState;
  _MyHomePageState._() : super._();

  @override
  DummyDataModel? get dummyDataModel;
  @override
  @JsonKey(ignore: true)
  _$$_MyHomePageStateCopyWith<_$_MyHomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
