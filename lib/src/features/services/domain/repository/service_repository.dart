

import '../../data/models/service_data_model.dart';

abstract class ServiceRepository {
  Future<List<ServiceDataModel>> getServiceList();
}