import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';

appShowModal(
    {required BuildContext context,
    EdgeInsetsGeometry? titlePadding,
    Widget? title,
    required Widget content,
    required List<Widget> actions}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: context.colorSchema.surface,
        contentPadding: Appsize.symetric(horizontal: 50, vertical: 20),
        actionsPadding: Appsize.symetric(horizontal: 20, vertical: 20),
        titlePadding: Appsize.symetric(horizontal: 20, vertical: 0),
        titleTextStyle: context.styleText.headlineLarge,
        title: Container(
            padding: Appsize.symetric(vertical: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: context.colorSchema.primary,
              width: 1,
            ))),
            child: title),
        content: content,
        actions: actions,
      );
    },
  );
}
