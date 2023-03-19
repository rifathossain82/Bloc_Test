import 'package:bloc_test/src/core/errors/errors.dart';
import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable{
  const BaseState();
}

class InitialState extends BaseState{
  @override
  List<Object?> get props => [];
}

class LoadingState extends BaseState{
  @override
  List<Object?> get props => [];
}

class SuccessState<T> extends BaseState{
  final T data;
  const SuccessState({required this.data});

  @override
  List<Object?> get props => [data];
}

class ErrorState extends BaseState{
  final BaseError error;
  const ErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}