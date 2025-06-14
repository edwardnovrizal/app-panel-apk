import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';
import 'package:panel_apk/src/presentation/widget/modal.dart';
import 'package:panel_apk/src/presentation/widget/text_button.dart';
import 'package:panel_apk/src/presentation/widget/textform.dart';

import '../../../../config/size_config.dart';

modalCreateAds({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController nameController,
  required TextEditingController codeController,
  required TextEditingController descController,
  required TextEditingController appidController,
  required TextEditingController interController,
  required TextEditingController bannerController,
  required TextEditingController nativeController,
  required TextEditingController appopenController,
}) {
  return appShowModal(
    context: context,
    title: const Text(
      "Tambah Unit Iklan",
      textAlign: TextAlign.center,
    ),
    content: Form(
      key: formKey,
      child: SizedBox(
        width: Appsize.width(context) * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            Row(
              spacing: 50,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppTextForm(
                        staticLabel: "Ad Name",
                        pddingHorizontal: 0,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        controller: nameController,
                        preffixIcon: const Icon(Icons.perm_identity_rounded),
                        hintText: "Admob Sinop",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ad Name tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      AppTextForm(
                        staticLabel: 'Ad Code',
                        pddingHorizontal: 0,
                        controller: codeController,
                        preffixIcon: const Icon(Icons.assignment_ind_rounded),
                        hintText: "admob-mix-fan / admob1 / meta1",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                        validator: (value) {
                          if (value != null && value.contains(' ')) {
                            return 'Ad Code tidak boleh mengandung spasi';
                          }
                          return null;
                        },
                      ),
                      AppTextForm(
                        staticLabel: 'Ad Description',
                        pddingHorizontal: 0,
                        controller: descController,
                        preffixIcon: const Icon(Icons.description_outlined),
                        hintText: "Akun admob di email xxxxx@gmail.com",
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
                        staticLabel: 'Unit Code APP ID',
                        pddingHorizontal: 0,
                        controller: appidController,
                        preffixIcon: const Icon(Icons.adb_outlined),
                        hintText: "ca-app-pub-3940256099942544~3347511713",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      AppTextForm(
                        staticLabel: "Unit Code Interstital",
                        pddingHorizontal: 0,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        controller: interController,
                        preffixIcon: const Icon(Icons.perm_identity_rounded),
                        hintText: "ca-app-pub-3940256099942544/1033173712",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                      ),
                      AppTextForm(
                        staticLabel: 'Unit Code Banner',
                        pddingHorizontal: 0,
                        controller: bannerController,
                        preffixIcon: const Icon(Icons.assignment_ind_rounded),
                        hintText: "ca-app-pub-3940256099942544/6300978111",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                      ),
                      AppTextForm(
                        staticLabel: 'Unit Code Native',
                        pddingHorizontal: 0,
                        controller: nativeController,
                        preffixIcon: const Icon(Icons.description_outlined),
                        hintText: "ca-app-pub-3940256099942544/2247696110",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                      ),
                      AppTextForm(
                        staticLabel: 'Unit Code App Open',
                        pddingHorizontal: 0,
                        controller: appopenController,
                        preffixIcon: const Icon(Icons.adb_outlined),
                        hintText: "ca-app-pub-3940256099942544/9257395921",
                        onChanged: (p0) {
                          if (p0.isNotEmpty) {}
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    actions: [
      AppTextButton(
        onPressed: () {
          nameController.clear();
          codeController.clear();
          appidController.clear();
          descController.clear();
          interController.clear();
          nativeController.clear();
          bannerController.clear();
          appopenController.clear();
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
      AppButton(
        width: 100,
        height: 50,
        widget: const Text('Simpan'),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            log("valid");
          }
        },
      )
    ],
  );
}
