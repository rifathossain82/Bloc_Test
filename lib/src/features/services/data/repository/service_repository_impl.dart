import 'package:bloc_test/src/core/errors/errors.dart';
import 'package:bloc_test/src/core/network/network_utils.dart';
import 'package:bloc_test/src/features/services/data/data_source/service_data_source.dart';
import 'package:bloc_test/src/features/services/domain/repository/service_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/service_data_model.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceDataSource dataSource;

  ServiceRepositoryImpl({required this.dataSource});

  @override
  Future<List<ServiceDataModel>> getServiceList() async {
    var param = <String, dynamic>{};
    param['page'] = '1';
    param['show'] = "10";
    param['search'] = "";

    var responseBody = await Network.handleResponse2(
      await dataSource.fetchServiceList(
        param,
      ),
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
