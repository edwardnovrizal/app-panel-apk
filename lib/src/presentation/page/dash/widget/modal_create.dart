import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';
import 'package:panel_apk/src/presentation/widget/modal.dart';
import 'package:panel_apk/src/presentation/widget/text_button.dart';

import '../../../bloc/project/project_bloc.dart';
import '../../../widget/state_waiting.dart';
import '../../../widget/textfield.dart';

modalCreate({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  String? token,
  TextEditingController? projectName,
  TextEditingController? packageName,
  TextEditingController? godevName,
  XFile? selectedImage,
  bool isError = false,
}) {
  return appShowModal(
    context: context,
    title: const Text("Buat Project Baru", textAlign: TextAlign.center),
    content: SizedBox(
      width: Appsize.width(context) * 0.2,
      child: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextfield(
                    label: "Nama Project",
                    controller: projectName!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Project tidak boleh kosong';
                      }
                      return null; // valid
                    },
                  ),
                  AppTextfield(
                    label: "Nama Package",
                    controller: packageName!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Package tidak boleh kosong';
                      }
                      return null; // valid
                    },
                  ),
                  AppTextfield(
                    label: "Nama Godev",
                    controller: godevName!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Godev tidak boleh kosong';
                      }
                      return null; // valid
                    },
                  ),
                  Padding(
                    padding: Appsize.symetric(vertical: 10),
                    child: Text(
                      "Upload Logo: ",
                      style: context.styleText.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 6),
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
                              child: Center(
                                child: Text(
                                  "Tap untuk pilih foto",
                                  style: context.styleText.labelMedium,
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
    ),
    actions: [
      AppTextButton(
        width: 200,
        child: const Text("Cancel"),
        onPressed: () {
          projectName!.clear();
          packageName!.clear();
          godevName!.clear();
          Navigator.of(context).pop();
        },
      ),
      BlocConsumer<ProjectBloc, ProjectState>(
        listener: (context, state) {
          if (state is CreateProjectLoaded) {
            Navigator.of(context).pop();
            projectName!.clear();
            packageName!.clear();
            godevName!.clear();
            context.read<ProjectBloc>().add(LoadProject(token!));
          }
        },
        builder: (context, state) {
          if (state is CreateProjectLoading) {
            return const SizedBox(
              width: 80,
              child: WStateWaiting(),
            );
          }
          if (state is CreateProjectLoaded) {
            return AppButton(
              isDisabled: true,
              width: 180,
              height: 50,
              widget: const Text("Submit"),
              onPressed: () {},
            );
          }
          if (state is CreateProjectError) {
            return AppButton(
              width: 180,
              height: 50,
              widget: const Text("Submit"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ProjectBloc>().add(CreateProject(
                        token: token!,
                        name: projectName!.text,
                        packageName: packageName!.text,
                        godevName: godevName!.text,
                        logo: selectedImage,
                      ));
                }
              },
            );
          }
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AppButton(
                width: 180,
                height: 50,
                widget: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ProjectBloc>().add(CreateProject(
                          token: token!,
                          name: projectName!.text,
                          packageName: packageName!.text,
                          godevName: godevName!.text,
                          logo: selectedImage,
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
