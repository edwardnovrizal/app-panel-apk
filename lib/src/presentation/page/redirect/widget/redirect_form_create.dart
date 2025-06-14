import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../../config/size_config.dart';
import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/text_button.dart';
import '../../../widget/textform.dart';

redirectFormCreate({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController name,
  required TextEditingController desc,
  required TextEditingController url,
  XFile? selectedImage,
}) {
  return appShowModal(
    context: context,
    title: const Text("Tambah Unit Notification Redirect", textAlign: TextAlign.center),
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
                  staticLabel: "Unit Title",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: name,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "Masukkan title untuk notification redirect",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
                  },
                ),
                AppTextForm(
                  staticLabel: "Unit Description",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: desc,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "Masukkan deskripsi untuk notification redirect",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Upload Thumbnail',
                    style: context.styleText.titleLarge,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    XFile? file = await picker.pickMedia();
                    setState(() {
                      selectedImage = file;
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(File(selectedImage!.path), fit: BoxFit.cover),
                          )
                        : Container(
                            color: context.colorSchema.onSurface.withAlpha(35),
                            width: Appsize.width(context) * 0.3,
                            height: 100,
                            child: Center(
                              child: Text(
                                "Tap untuk pilih foto",
                                style: context.styleText.bodyMedium,
                              ),
                            ),
                          ),
                  ),
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
