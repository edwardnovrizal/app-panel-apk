import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';

class AppContentTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const AppContentTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Appsize.symetric(vertical: 20, horizontal: 16),
      margin: Appsize.only(bottom: 20),
      decoration: BoxDecoration(
        color: context.colorSchema.primary.withAlpha(50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.styleText.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: context.styleText.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
