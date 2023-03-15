import 'package:bloc_test/src/features/services/data/model/service_data_model.dart';
import 'package:bloc_test/src/features/services/data/repository/service_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceRepository serviceRepository;
  ServiceBloc(this.serviceRepository) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) async {
      if (event is GetServiceList) {
        try {
          emit(ServiceLoading());
          List<ServiceData> serviceList = await serviceRepository.fetchServiceList();
          emit(ServiceLoaded(serviceList: serviceList));
        } on Exception catch (e) {
          emit(ServiceError(message: '$e'));
        } catch (e) {
          emit(ServiceError(message: '$e'));
        }
      }
    });
  }
}
