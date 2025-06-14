import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../config/size_config.dart';

class AppButton extends StatelessWidget {
  final Widget widget;
  final double? width;
  final double? height;
  final bool? isDisabled;
  final Color? backgroundColor;
  final Color? foregroundColor;

  final VoidCallback onPressed;
  const AppButton(
      {super.key,
      required this.widget,
      this.width,
      required this.onPressed,
      this.height,
      this.isDisabled = false,
      this.backgroundColor,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? context.colorSchema.primary,
            // fixedSize: Size(width ?? Appsize.width(context), height ?? 40),
            minimumSize: Size(width ?? Appsize.width(context), height ?? 40),
            textStyle: context.styleText.titleLarge),
        onPressed: isDisabled == true ? null : onPressed,
        child: widget);
  }
}
