import 'dart:io';

import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../../config/size_config.dart';

Widget buildWarningBox(BuildContext context) {
  return Container(
    color: context.colorSchema.secondary.withAlpha(35),
    width: Appsize.width(context) * 0.3,
    height: 100,
    child: Center(
      child: Text(
        "Foto tidak boleh lebih dari 1MB",
        style: context.styleText.bodyMedium,
      ),
    ),
  );
}

Widget buildTapToSelectBox(BuildContext context) {
  return Container(
    color: context.colorSchema.onSurface.withAlpha(35),
    width: Appsize.width(context) * 0.3,
    height: 100,
    child: Center(
      child: Text(
        "Tap untuk pilih foto",
        style: context.styleText.bodyMedium,
      ),
    ),
  );
}

Widget buildImagePreview(File? file) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.file(
      File(file!.path),
      fit: BoxFit.cover,
    ),
  );
}
