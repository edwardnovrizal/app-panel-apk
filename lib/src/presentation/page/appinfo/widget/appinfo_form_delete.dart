import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';
import 'package:panel_apk/src/presentation/widget/modal.dart';
import 'package:panel_apk/src/presentation/widget/text_button.dart';

appInfoFormDelete(BuildContext context) {
  return appShowModal(
    context: context,
    title: const Text("Hapus Unit App Information", textAlign: TextAlign.center),
    content: Text(
      "Anda yakin ingin menghapus unit App Information ini?",
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
