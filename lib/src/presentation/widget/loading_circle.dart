import 'package:flutter/material.dart';

import '../../config/color_config.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size = 30, this.color = AppColor.primary});
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: color,
        ),
      ),
    );
  }
}
