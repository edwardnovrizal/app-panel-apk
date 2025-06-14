import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/text_button.dart';
import '../../../widget/textform.dart';

asnFormCreate({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController name,
}) {
  return appShowModal(
    context: context,
    title: const Text("Tambah Unit Blokir ASN", textAlign: TextAlign.center),
    content: StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Form(
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
                  hintText: "Masukkan name untuk blokir asn",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
                  },
                ),
              ],
            ),
          ),
        );
      },
    ),
    actions: [
      AppTextButton(
        onPressed: () {
          name.clear();
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
