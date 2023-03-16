import 'package:bloc_test/src/features/services/data/data_source/service_data_source.dart';
import 'package:bloc_test/src/features/services/domain/repository/service_repository.dart';

import '../models/service_data_model.dart';

class ServiceRepositoryImpl implements ServiceRepository {

  final ServiceDataSource dataSource;
  ServiceRepositoryImpl({required this.dataSource});

  @override
  Future<List<ServiceDataModel>> getServiceList() async {
    return await dataSource.fetchServiceList();
  }
}
