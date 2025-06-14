import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/text_button.dart';

modalDeleteAds({
  required BuildContext context,
  required String idProject,
  required String token,
}) {
  return appShowModal(
      context: context,
      title: const Text("Hapus Ads Network", textAlign: TextAlign.center),
      content: Text(
        "Anda yakin ingin menghapus unit Ads ini?",
        textAlign: TextAlign.center,
        style: context.styleText.bodySmall,
      ),
      actions: [
        AppTextButton(
          child: Text(
            "Batal",
            style: context.styleText.titleLarge!.copyWith(
              color: context.colorSchema.primary,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        AppButton(
          width: 80,
          height: 50,
          widget: Text(
            "Hapus",
            style: context.styleText.titleLarge!.copyWith(
              color: context.colorSchema.surface,
            ),
          ),
          onPressed: () {},
        ),
      ]);
}
