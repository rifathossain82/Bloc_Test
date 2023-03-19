import 'package:bloc_test/src/core/base/base_state.dart';
import 'package:bloc_test/src/core/extensions/build_context_extension.dart';
import 'package:bloc_test/src/core/widgets/custom_loader.dart';
import 'package:bloc_test/src/core/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_test/src/core/widgets/no_data_found.dart';
import 'package:bloc_test/src/features/news/presentation/bloc/news_bloc.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<NewsScreen> {
  @override
  void didChangeDependencies() {
    context.read<NewsBloc>().add(GetNews());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Screen'),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsError) {
            context.showSnackBar(state.error.message);
          }
        },
        builder: (context, state) {
          if (state is NewsError) {
            return ErrorScreen(error: state.error);
          } else if (state is NewsLoaded) {
            if(state.newsData.news!.isEmpty) return const NoDataFound();

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.newsData.news!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Text(state.newsData.news![index].title.toString()),
                );
              },
            );
          } else {
            return const CustomLoader();
          }
        },
      ),
    );
  }
}
