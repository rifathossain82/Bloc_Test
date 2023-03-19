import 'package:bloc_test/src/features/services/data/models/service_data_model.dart';
import 'package:http/http.dart';

abstract class ServiceDataSource{
  Future<Response> fetchServiceList(Map requestBody);
}