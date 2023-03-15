
import '../model/service_data_model.dart';

abstract class ServiceRepository {
  Future<List<ServiceData>> fetchServiceList();
}