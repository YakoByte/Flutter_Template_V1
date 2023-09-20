import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dummy_data/dummy_data_repo.dart';
import '../../domain/dummy_data/dummy_data.dart';

abstract class DummyDataService {
  @override
  Future<DummyDataModel?> dummyData();
}

class DummyDataServiceV1 implements DummyDataService {
  DummyDataServiceV1(
    this.dummyDataRepository,
  );
  final DummyDataRepository dummyDataRepository;
  DummyDataModel? dummyDataModel;
  @override
  Future<DummyDataModel?> dummyData() async {
    dummyDataModel = await dummyDataRepository.dummyData();

    return dummyDataModel;
  }
}

final dummyDataServiceProvider = Provider.autoDispose<DummyDataService>((ref) {
  final service = DummyDataServiceV1(
    ref.watch(dummyDataRepositoryProvider),
  );
  return service;
});
