import 'package:bloc_test/src/core/di/injection_container.dart';
import 'package:bloc_test/src/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/news/presentation/bloc/news_bloc.dart';
import 'src/features/services/presentation/bloc/service_bloc.dart';
import 'src/features/settings/presentation/cubit/settings_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ServiceBloc>()),
        BlocProvider(create: (context) => sl<NewsBloc>()),
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
