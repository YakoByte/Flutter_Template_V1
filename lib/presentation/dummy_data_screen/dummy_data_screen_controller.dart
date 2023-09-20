import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodtemp/application/dummy_data/dummy_data_service.dart';

import '../../domain/dummy_data/dummy_data.dart';

part 'dummy_data_screen_controller.g.dart';
part 'dummy_data_screen_controller.freezed.dart';

@freezed
class MyHomePageState with _$MyHomePageState {
  factory MyHomePageState({
    DummyDataModel? dummyDataModel,
  }) = _MyHomePageState;

  MyHomePageState._();
}

@riverpod
class MyHomePageController extends _$MyHomePageController {
  @override
  FutureOr<MyHomePageState> build() async {
    state = const AsyncLoading();
    getDummyData();

    return MyHomePageState();
  }

  getDummyData() async {
    state = const AsyncLoading();
    DummyDataModel? dummyData =
        await ref.read(dummyDataServiceProvider).dummyData();
    state = AsyncValue.data(state.value!.copyWith(dummyDataModel: dummyData!));
  }
}
