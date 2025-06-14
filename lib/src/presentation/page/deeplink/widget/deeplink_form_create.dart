import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/text_button.dart';
import '../../../widget/textform.dart';

deeplinkFormCreate({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController name,
  required TextEditingController package,
  required TextEditingController scheme,
  required TextEditingController path,
  required TextEditingController query,
}) {
  return appShowModal(
    context: context,
    title: const Text("Tambah Unit Deeplink", textAlign: TextAlign.center),
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
              hintText: "Deeplink 1",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unit Name Deeplink tidak boleh kosong';
                }
                return null;
              },
            ),
            AppTextForm(
              staticLabel: "Package Name",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: package,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "Package Name aplikasi yang ingin anda akses {com.example.aplikasi}",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
            ),
            AppTextForm(
              staticLabel: "Unit Scheme",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: scheme,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "{scheme}://xxxxx",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
            ),
            AppTextForm(
              staticLabel: "Unit Path",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: scheme,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "xxxxxxx://{path}",
              onChanged: (p0) {
                if (p0.isNotEmpty) {}
              },
            ),
            AppTextForm(
              staticLabel: "Unit Query",
              pddingHorizontal: 0,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              controller: scheme,
              preffixIcon: const Icon(Icons.perm_identity_rounded),
              hintText: "xxxxxxx://xxxxxxx?{query}",
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
          package.clear();
          scheme.clear();
          path.clear();
          query.clear();
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
