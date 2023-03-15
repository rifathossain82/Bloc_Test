
import 'package:bloc_test/src/features/services/data/repository/service_repository.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/network_utils.dart';
import '../model/service_data_model.dart';

class ServiceRepositoryImplement implements ServiceRepository {
  @override
  Future<List<ServiceData>> fetchServiceList() async {
    var param = <String, dynamic>{};
    param['page'] = '1';
    param['show'] = "10";
    param['search'] = "";

    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(api: Api.serviceList, params: param),
    );
    List<ServiceData> serviceList = [];

    if (responseBody != null) {
      var data = responseBody['services']['data'];
      if (data != null) {
        for (Map<String, dynamic> i in data) {
          serviceList.add(ServiceData.fromJson(i));
        }
      }
    }

    return serviceList;
  }
}
