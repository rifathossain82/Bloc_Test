import 'package:bloc_test/src/features/services/domain/repository/service_repository.dart';

import '../../data/models/service_data_model.dart';

class ServiceUseCase{
  ServiceRepository serviceRepository;
  ServiceUseCase({required this.serviceRepository});

  Future<List<ServiceDataModel>> getServiceList() async{
    return await serviceRepository.getServiceList();
  }
}