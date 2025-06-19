import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import 'create_widget.dart';

void showAppInfoFormDialog({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String token,
  required String projectId,
  required TextEditingController title,
  required TextEditingController name,
  required TextEditingController thumbnail,
  required TextEditingController version,
  required TextEditingController telegram,
  required TextEditingController whatsapp,
  required TextEditingController email,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: context.colorSchema.surface,
        child: AppInfoFormDialog(
          formKey: formKey,
          token: token,
          projectId: projectId,
          title: title,
          name: name,
          thumbnail: thumbnail,
          version: version,
          telegram: telegram,
          whatsapp: whatsapp,
          email: email,
        ),
      );
    },
  );
}
