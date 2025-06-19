import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/commons/shared_pref.dart';

import '../../../../../commons/enum.dart';
import '../../../../../commons/navigate_handle.dart';
import '../../../../../config/route_config.dart';
import '../../../../bloc/appinfo/appinfo_bloc.dart';
import '../../../../widget/button.dart';
import '../../../../widget/snackbar.dart';
import '../../../../widget/state_waiting.dart';
import '../../../../widget/text_button.dart';
import '../../../../widget/textform.dart';
import '../upload_image_box.dart';

class AppInfoFormDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String token;
  final String projectId;
  final TextEditingController title;
  final TextEditingController name;
  final TextEditingController thumbnail;
  final TextEditingController version;
  final TextEditingController telegram;
  final TextEditingController whatsapp;
  final TextEditingController email;

  const AppInfoFormDialog({
    super.key,
    required this.formKey,
    required this.token,
    required this.projectId,
    required this.title,
    required this.name,
    required this.thumbnail,
    required this.version,
    required this.telegram,
    required this.whatsapp,
    required this.email,
  });

  @override
  State<AppInfoFormDialog> createState() => _AppInfoFormDialogState();
}

class _AppInfoFormDialogState extends State<AppInfoFormDialog> {
  XFile? selectedImage;
  bool isErrorUpload = false;
  bool isErrorSubmit = false;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Tambah Unit App Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Form(
            key: widget.formKey,
            child: Column(
              children: [
                AppTextForm(
                  staticLabel: "Info Name",
                  controller: widget.name,
                  hintText: "Masukkan nama untuk App Information",
                  preffixIcon: const Icon(Icons.perm_identity),
                  validator: (value) => value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
                ),
                AppTextForm(
                  staticLabel: "Version",
                  controller: widget.version,
                  hintText: "1.0.0",
                  preffixIcon: const Icon(Icons.numbers),
                ),
                AppTextForm(
                  staticLabel: "Telegram",
                  controller: widget.telegram,
                  hintText: "@username",
                  preffixIcon: const Icon(Icons.telegram),
                ),
                AppTextForm(
                  staticLabel: "Whatsapp",
                  controller: widget.whatsapp,
                  hintText: "+628123456789",
                  preffixIcon: const Icon(Icons.phone),
                ),
                AppTextForm(
                  staticLabel: "Email",
                  controller: widget.email,
                  hintText: "you@example.com",
                  preffixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 10),
                Text("Upload Thumbnail", style: context.styleText.titleLarge),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    XFile? file = await picker.pickMedia();
                    if (file != null) {
                      double sizeInMB = (await file.length()) / (1024 * 1024);
                      if (sizeInMB > 1) {
                        setState(() {
                          isErrorUpload = true;
                        });
                        return;
                      }
                      setState(() {
                        selectedImage = file;
                        isErrorUpload = false;
                      });
                    }
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: selectedImage != null
                        ? isErrorUpload
                            ? buildWarningBox(context)
                            : buildImagePreview(File(selectedImage!.path))
                        : isErrorUpload
                            ? buildWarningBox(context)
                            : buildTapToSelectBox(context),
                  ),
                ),
                if (isErrorSubmit)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorMessage,
                      style: context.styleText.headlineMedium!.copyWith(color: context.colorSchema.secondary),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 10),
              BlocConsumer<AppinfoBloc, AppinfoState>(
                listener: (context, state) {
                  if (state is AppInfoSuccessCreate) {
                    Navigator.of(context).pop();
                    context.read<AppinfoBloc>().add(ReadAppInfoEvent(
                          token: widget.token,
                          projectId: widget.projectId,
                        ));
                  } else if (state is AppinfoErrorCreate) {
                    setState(() {
                      isErrorSubmit = true;
                      errorMessage = state.msgError;
                    });
                  } else if (state is TokenExpiredState) {
                    AppSharedPref.removeToken();
                    NavigateHandle.byTypeRoute(
                      context: context,
                      typeRoute: TypeRoute.removeUntil,
                      path: AppRoute.auth,
                    );
                    appSnackbar(context, message: "Token Expired");
                  }
                },
                builder: (context, state) {
                  if (state is AppinfoLoadingCreate) {
                    return const WStateWaiting(width: 100, size: 25);
                  }
                  return AppButton(
                    width: 100,
                    height: 50,
                    widget: const Text("Simpan"),
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        context.read<AppinfoBloc>().add(CreateAppInfoEvent(
                              token: widget.token,
                              name: widget.name.text,
                              version: widget.version.text,
                              telegram: widget.telegram.text,
                              whatsapp: widget.whatsapp.text,
                              email: widget.email.text,
                              thumbnail: selectedImage,
                              projectId: widget.projectId,
                            ));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
