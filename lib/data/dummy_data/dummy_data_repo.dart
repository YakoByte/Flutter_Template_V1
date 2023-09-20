import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/dummy_data/dummy_data.dart';
import '../../utils/config.dart';
import '../api_client/api_client.dart';
import '../shared_pref/shared_pref.dart';

abstract class DummyDataRepository {
  Future<DummyDataModel?> dummyData();
}

class DummyDataRepositoryV1 implements DummyDataRepository {
  DummyDataRepositoryV1(this.api);
  final ApiClient api;
  @override
  Future<DummyDataModel?> dummyData() {
    return api.getData(
      uri: Uri.parse(ApiConfig.getPopularity),
      headers: api.createHeaders(
        authtoken: "",
      ),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        DummyDataModel dummyDataModel = DummyDataModel.fromJson(jsonMap);
        debugPrint("dummyDataModel data is =- $dummyDataModel");

        if (dummyDataModel.status == "ok") {
          return dummyDataModel;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final dummyDataRepositoryProvider =
    Provider<DummyDataRepository>((ref) => DummyDataRepositoryV1(
          ApiClient(),
        ));
