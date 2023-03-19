import 'package:bloc_test/src/core/network/api.dart';
import 'package:bloc_test/src/core/network/network_utils.dart';
import 'package:bloc_test/src/features/services/data/data_source/service_data_source.dart';
import 'package:bloc_test/src/features/services/data/models/service_data_model.dart';
import 'package:http/http.dart';

class ServiceDataSourceImpl extends ServiceDataSource {
  @override
  Future<Response> fetchServiceList(Map requestBody) async {

    Response response = await Network.getRequest(
      api: Api.serviceList,
      params: requestBody,
    );

    return response;
  }
}
