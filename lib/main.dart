import 'package:bloc_test/routes/routes.dart';
import 'package:bloc_test/src/features/news/bloc/news_bloc.dart';
import 'package:bloc_test/src/features/news/data/repository/news_repository_implement.dart';
import 'package:bloc_test/src/features/services/bloc/service_bloc.dart';
import 'package:bloc_test/src/features/services/data/repository/service_repository_impl.dart';
import 'package:bloc_test/src/features/settings/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ServiceBloc(ServiceRepositoryImplement())),
        BlocProvider(create: (context) => NewsBloc(NewsRepositoryImplement())),
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: const MaterialApp(
        title: 'Bloc Test App',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.service,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
