part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class GetServiceList extends ServiceEvent {
  @override
  List<Object> get props => [];
}

