import 'package:flutter/material.dart';

extension AppExtension on BuildContext {
  TextTheme get styleText => Theme.of(this).textTheme;
  ColorScheme get colorSchema => Theme.of(this).colorScheme;
}

extension ContextResponsive on BuildContext {
  double wp(double percent) => MediaQuery.of(this).size.width * (percent / 100);
  double hp(double percent) => MediaQuery.of(this).size.height * (percent / 100);
}
