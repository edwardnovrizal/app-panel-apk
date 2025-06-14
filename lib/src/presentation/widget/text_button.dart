import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

class AppTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? isDisabled;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget child;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.width,
    this.height,
    this.isDisabled,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor ?? Theme.of(context).colorScheme.primary,
        textStyle: context.styleText.titleLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: child,
    );
  }
}
