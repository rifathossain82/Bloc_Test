import 'package:bloc_test/src/core/utils/color.dart';
import 'package:bloc_test/src/features/services/data/models/service_data_model.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final ServiceDataModel serviceData;

  const ServiceItem({Key? key, required this.serviceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: kItemShadowColor,
          ),
        ],
      ),
      child: Text('${serviceData.title}'),
    );
  }
}
