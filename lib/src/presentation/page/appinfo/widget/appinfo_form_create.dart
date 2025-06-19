import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/bloc/appinfo/appinfo_bloc.dart';
import 'package:panel_apk/src/presentation/page/appinfo/widget/upload_image_box.dart';
import 'package:panel_apk/src/presentation/widget/state_waiting.dart';

import '../../../../commons/enum.dart';
import '../../../../commons/navigate_handle.dart';
import '../../../../commons/shared_pref.dart';
import '../../../../config/route_config.dart';
import '../../../../config/size_config.dart';
import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/snackbar.dart';
import '../../../widget/text_button.dart';
import '../../../widget/textform.dart';

appInfoFormCreate({
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
  XFile? selectedImage,
}) {
  bool isErrorUpload = false;
  bool isErrorSubmit = false;
  String errorMessage = "ini error";
  return appShowModal(
    context: context,
    title: const Text("Tambah Unit App Information", textAlign: TextAlign.center),
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
                  staticLabel: "Info Name",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: name,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "Masukkan nama untuk App Information",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                AppTextForm(
                  staticLabel: "Version",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: version,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "1.0.0",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
                  },
                ),
                AppTextForm(
                  staticLabel: "Telegram",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: telegram,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "@username",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
                  },
                ),
                AppTextForm(
                  staticLabel: "Whatsapp",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: whatsapp,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "+628123456789",
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {}
                  },
                ),
                AppTextForm(
                  staticLabel: "Email",
                  pddingHorizontal: 0,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  controller: email,
                  preffixIcon: const Icon(Icons.perm_identity_rounded),
                  hintText: "jv8lE@example.com",
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

                    if (file != null) {
                      int sizeInBytes = await file.length();
                      double sizeInMB = sizeInBytes / (1024 * 1024); // Konversi ke MB

                      if (sizeInMB > 1) {
                        if (context.mounted) {
                          setState(() {
                            isErrorUpload = true;
                          });
                        }
                        return; // hentikan proses
                      }

                      setState(() {
                        selectedImage = file;
                        isErrorUpload = false;
                      });
                    }
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
                        ? isErrorUpload == true
                            ? buildWarningBox(context)
                            : buildImagePreview(File(selectedImage!.path))
                        : isErrorUpload == true
                            ? buildWarningBox(context)
                            : buildTapToSelectBox(context),
                  ),
                ),
                isErrorSubmit
                    ? Container(
                        padding: Appsize.symetric(vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          errorMessage,
                          style: context.styleText.headlineMedium!.copyWith(color: context.colorSchema.secondary),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    ),
    actions: [
      const Spacer(),
      AppTextButton(
        onPressed: () {
          name.clear();
          version.clear();
          telegram.clear();
          whatsapp.clear();
          email.clear();
          selectedImage = null;
          name.clear();
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
      StatefulBuilder(
        builder: (context, setState) {
          return BlocConsumer<AppinfoBloc, AppinfoState>(
            listener: (context, state) {
              if (state is AppInfoSuccessCreate) {
                log("sukses create");
                setState(() {
                  name.clear();
                  version.clear();
                  telegram.clear();
                  whatsapp.clear();
                  email.clear();
                  selectedImage = null;
                  Navigator.of(context).pop();
                  context.read<AppinfoBloc>().add(ReadAppInfoEvent(token: token, projectId: projectId));
                  isErrorSubmit = false;
                });
              }
              if (state is AppinfoErrorCreate) {
                setState(() {
                  isErrorSubmit = true;
                  errorMessage = state.msgError;
                  context.read<AppinfoBloc>().add(ReadAppInfoEvent(token: token, projectId: projectId));
                });
              }
              if (state is TokenExpiredState) {
                AppSharedPref.removeToken();
                NavigateHandle.byTypeRoute(context: context, typeRoute: TypeRoute.removeUntil, path: AppRoute.auth);
                appSnackbar(context, message: "Token Expired");
              }
            },
            builder: (context, state) {
              if (state is AppinfoLoadingCreate) {
                return const WStateWaiting(
                  width: 100,
                  size: 25,
                );
              }
              if (state is AppinfoErrorCreate) {
                return AppButton(
                    width: 100,
                    height: 50,
                    widget: const Text('Simpan'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AppinfoBloc>().add(CreateAppInfoEvent(
                              token: token,
                              name: name.text,
                              version: version.text,
                              telegram: telegram.text,
                              whatsapp: whatsapp.text,
                              email: email.text,
                              thumbnail: selectedImage,
                              projectId: projectId,
                            ));
                      }
                    });
              }
              if (state is AppInfoSuccessCreate) {
                return Container();
              }
              return AppButton(
                width: 100,
                height: 50,
                widget: const Text('Simpan'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AppinfoBloc>().add(CreateAppInfoEvent(
                          token: token,
                          name: name.text,
                          version: version.text,
                          telegram: telegram.text,
                          whatsapp: whatsapp.text,
                          email: email.text,
                          thumbnail: selectedImage,
                          projectId: projectId,
                        ));
                  }
                },
              );
            },
          );
        },
      )
    ],
  );
}
