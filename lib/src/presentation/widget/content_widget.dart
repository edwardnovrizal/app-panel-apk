import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

class AppContentWidget extends StatelessWidget {
  const AppContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: context.colorSchema.secondary.withAlpha(150),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 80,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ADS',
                style: context.styleText.bodyLarge,
              ),
            ),
            Text(
              'Admob',
              style: context.styleText.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
