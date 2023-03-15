import 'dart:math';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext{

  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  void showSnackBar(String message) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ),
  );

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  double get minScreenSize => min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  double get maxScreenSize => max(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

}