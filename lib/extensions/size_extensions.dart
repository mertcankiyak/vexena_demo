import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;
}
