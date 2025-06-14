// lib/utils/responsive.dart

import 'package:flutter/widgets.dart';

class Responsive {
  // simpan ukuran layar
  static late double _screenWidth;
  static late double _screenHeight;

  /// Panggil ini sekali di awal (biasanya di build() MaterialApp)
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }

  /// width berdasarkan persentase (0–100)
  static double wp(double percent) => _screenWidth * (percent / 100);

  /// height berdasarkan persentase (0–100)
  static double hp(double percent) => _screenHeight * (percent / 100);
}
