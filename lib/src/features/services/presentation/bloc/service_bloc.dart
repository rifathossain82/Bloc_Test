import 'package:bloc_test/src/features/services/data/data_source/service_data_source_impl.dart';
import 'package:bloc_test/src/features/services/data/repository/service_repository_impl.dart';
import 'package:bloc_test/src/features/services/domain/use_case/service_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/service_data_model.dart';

part 'service_event.dart';

part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceUseCase serviceUseCase = ServiceUseCase(
    serviceRepository: ServiceRepositoryImpl(
      dataSource: ServiceDataSourceImpl(),
    ),
  );

  ServiceBloc() : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) async {
      if (event is GetServiceList) {
        try {
          emit(ServiceLoading());
          List<ServiceDataModel> serviceList =
              await serviceUseCase.getServiceList();
          emit(ServiceLoaded(serviceList: serviceList));
        } catch (e) {
          emit(ServiceError(message: '$e'));
        }
      }
    });
  }
}
