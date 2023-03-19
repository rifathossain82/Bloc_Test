import 'package:bloc_test/src/core/errors/errors.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final BaseError error;

  const ErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.message),
    );
  }
}
