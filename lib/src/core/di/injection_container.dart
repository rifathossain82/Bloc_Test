import 'package:bloc_test/src/features/news/data/data_source/news_data_source.dart';
import 'package:bloc_test/src/features/news/data/data_source/news_data_source_impl.dart';
import 'package:bloc_test/src/features/news/data/repository/news_repository_impl.dart';
import 'package:bloc_test/src/features/news/domain/repository/news_repository.dart';
import 'package:bloc_test/src/features/news/domain/use_case/news_use_case.dart';
import 'package:bloc_test/src/features/news/presentation/bloc/news_bloc.dart';
import 'package:bloc_test/src/features/services/data/data_source/service_data_source.dart';
import 'package:bloc_test/src/features/services/data/data_source/service_data_source_impl.dart';
import 'package:bloc_test/src/features/services/data/repository/service_repository_impl.dart';
import 'package:bloc_test/src/features/services/domain/repository/service_repository.dart';
import 'package:bloc_test/src/features/services/domain/use_case/service_use_case.dart';
import 'package:bloc_test/src/features/services/presentation/bloc/service_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async{
  /// Features

  /// services
  // bloc
  sl.registerFactory(() => ServiceBloc(serviceUseCase: sl()));

  // use case
  sl.registerLazySingleton(() => ServiceUseCase(serviceRepository: sl()));

  // repository
  sl.registerLazySingleton<ServiceRepository>(() => ServiceRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<ServiceDataSource>(() => ServiceDataSourceImpl());


  /// news
  // bloc
  sl.registerFactory(() => NewsBloc(useCase: sl()));

  // use case
  sl.registerLazySingleton(() => NewsUseCase(newsRepository: sl()));

  // repository
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(dataSource: sl()));

  // data source
  sl.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl());

  /// Core


  /// External
}