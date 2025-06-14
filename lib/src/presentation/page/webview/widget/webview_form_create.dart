import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/widget/modal.dart';

import '../../../../config/size_config.dart';
import '../../../widget/button.dart';
import '../../../widget/text_button.dart';
import '../../../widget/textform.dart';

webviewFormCreate({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController name,
  required TextEditingController desc,
  required TextEditingController url,
}) {
  return appShowModal(
    context: context,
    title: const Text("Tambah Unit Webview", textAlign: TextAlign.center),
    content: Form(
      key: formKey,
      child: SizedBox(
        width: Appsize.width(context) * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextForm(
              staticLabel: "Unit Name",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: name,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "Webview 1",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unit Name Webview tidak boleh kosong';
                }
                return null;
              },
            ),
            AppTextForm(
              staticLabel: "Unit Description",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: desc,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "URL Webview yang menggunakan domain xxxxxx.com",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
              validator: (value) {
                if (value != null && value.length > 150) {
                  return 'Maksimal 150 karakter';
                }
                return null;
              },
            ),
            AppTextForm(
              staticLabel: "URL Webview",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: url,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "https://domain.com",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
            ),
          ],
        ),
      ),
    ),
    actions: [
      AppTextButton(
        onPressed: () {
          name.clear();
          desc.clear();
          url.clear();
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
      AppButton(
        width: 100,
        height: 50,
        widget: const Text('Simpan'),
        onPressed: () {
          if (formKey.currentState!.validate()) {}
        },
      )
    ],
  );
}
