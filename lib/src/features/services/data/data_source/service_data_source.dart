import 'package:bloc_test/src/features/services/data/models/service_data_model.dart';

abstract class ServiceDataSource{
  Future<List<ServiceDataModel>> fetchServiceList();
}