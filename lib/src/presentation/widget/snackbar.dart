import 'dart:async';

import 'package:flutter/material.dart';

import 'loading_circle.dart';

void appSnackbar(BuildContext context, {String? message, FutureOr<void> Function()? onClose}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message!,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const AppLoading(size: 20),
          ],
        ),
        duration: const Duration(seconds: 2),
      ))
      .closed
      .whenComplete(() {
    if (onClose != null) {
      onClose();
    }
  });
}
