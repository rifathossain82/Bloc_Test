import 'package:bloc_test/src/core/errors/errors.dart';
import 'package:bloc_test/src/features/services/domain/use_case/service_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/src/features/services/data/models/service_data_model.dart';

part 'service_event.dart';

part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceUseCase serviceUseCase;

  ServiceBloc({required this.serviceUseCase}) : super(ServiceInitial()) {
    on<ServiceEvent>(_onServiceEvent);
  }

  void _onServiceEvent(ServiceEvent event, Emitter emit)async{
    if (event is GetServiceList) {
      try {
        emit(ServiceLoading());
        List<ServiceDataModel> serviceList = await serviceUseCase.getServiceList();
        emit(ServiceLoaded(serviceList: serviceList));
      } on BaseError catch (baseError) {
        emit(ServiceError(error: baseError));
      } catch (e) {
        emit(ServiceError(error: UnknownError(message: '$e')));
      }
    }
  }
}
