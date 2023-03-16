import 'package:bloc_test/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/news/presentation/bloc/news_bloc.dart';
import 'src/features/services/presentation/bloc/service_bloc.dart';
import 'src/features/settings/presentation/cubit/settings_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ServiceBloc()),
        BlocProvider(create: (context) => NewsBloc()),
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
