part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object?> get props => [];
}

class ServiceInitial extends ServiceState {
  @override
  List<Object> get props => [];
}

class ServiceLoading extends ServiceState {
  @override
  List<Object> get props => [];
}

class ServiceLoaded extends ServiceState {
  final List<ServiceDataModel> serviceList;
  const ServiceLoaded({required this.serviceList});

  @override
  List<Object> get props => [serviceList];
}

class ServiceError extends ServiceState {
  final BaseError error;
  const ServiceError({required this.error});

  @override
  List<Object> get props => [error];
}