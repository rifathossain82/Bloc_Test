import 'package:bloc_test/src/core/network/api.dart';
import 'package:bloc_test/src/core/network/network_utils.dart';
import 'package:bloc_test/src/features/services/data/data_source/service_data_source.dart';
import 'package:bloc_test/src/features/services/data/models/service_data_model.dart';

class ServiceDataSourceImpl extends ServiceDataSource{
  @override
  Future<List<ServiceDataModel>> fetchServiceList() async{
    var param = <String, dynamic>{};
    param['page'] = '1';
    param['show'] = "10";
    param['search'] = "";

    dynamic responseBody = await Network.handleResponse(
      await Network.getRequest(api: Api.serviceList, params: param),
    );
    List<ServiceDataModel> serviceList = [];

    if (responseBody != null) {
      var data = responseBody['services']['data'];
      if (data != null) {
        for (Map<String, dynamic> i in data) {
          serviceList.add(ServiceDataModel.fromJson(i));
        }
      }
    }

    return serviceList;
  }

}