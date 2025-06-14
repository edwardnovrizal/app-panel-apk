import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/text_button.dart';

countryFormDelete(BuildContext context) {
  return appShowModal(
    context: context,
    title: const Text("Hapus Unit Country", textAlign: TextAlign.center),
    content: Text(
      "Anda yakin ingin menghapus unit Blokir Country ini?",
      textAlign: TextAlign.center,
      style: context.styleText.bodyMedium,
    ),
    actions: [
      AppTextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Batal"),
      ),
      AppButton(
        onPressed: () {},
        width: 80,
        height: 50,
        widget: Text(
          "Hapus",
          style: context.styleText.titleLarge!.copyWith(
            color: context.colorSchema.surface,
          ),
        ),
      )
    ],
  );
}
