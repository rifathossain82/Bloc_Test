// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_test/routes/routes.dart';
import 'package:bloc_test/src/core/extensions/build_context_extension.dart';
import 'package:bloc_test/src/core/helpers/helper_methods.dart';
import 'package:bloc_test/src/core/utils/color.dart';
import 'package:bloc_test/src/core/utils/dimensions.dart';
import 'package:bloc_test/src/features/services/presentation/view/components/service_item.dart';
import 'package:bloc_test/src/widgets/custom_loader.dart';
import 'package:bloc_test/src/widgets/no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/service_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void didChangeDependencies() {
    context.read<ServiceBloc>().add(GetServiceList());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: const Text('Service Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteGenerator.news);
            },
            icon: const Icon(Icons.newspaper),
          ),
          addHorizontalSpace(Dimensions.paddingSizeSmall),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteGenerator.settings);
            },
            icon: const Icon(Icons.settings),
          ),
          addHorizontalSpace(Dimensions.paddingSizeDefault),
        ],
      ),
      body: BlocConsumer<ServiceBloc, ServiceState>(
        listener: (context, state) {
          if (state is ServiceError) {
            context.showSnackBar(state.message);
          }
        },
        builder: (context, state) {
          if (state is ServiceInitial || state is ServiceLoading) {
            return const CustomLoader();
          } else if (state is ServiceLoaded) {
            return _buildServiceList(state);
          } else {
            return const NoDataFound();
          }
        },
      ),
    );
  }

  Widget _buildServiceList(ServiceLoaded state) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: state.serviceList.length,
      itemBuilder: (BuildContext context, int index) {
        return ServiceItem(serviceData: state.serviceList[index]);
      },
      separatorBuilder: (context, index) =>
          addVerticalSpace(Dimensions.paddingSizeSmall),
    );
  }
}
