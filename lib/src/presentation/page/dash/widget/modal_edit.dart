import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/api_config.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';
import 'package:panel_apk/src/presentation/widget/modal.dart';
import 'package:panel_apk/src/presentation/widget/text_button.dart';

import '../../../bloc/project/project_bloc.dart';
import '../../../widget/state_waiting.dart';
import '../../../widget/textfield.dart';

modalEdit({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  String? token,
  String? projectName,
  String? packageName,
  String? godevName,
  String? logo,
  XFile? selectedImage,
  bool isError = false,
  String? idProject,
}) {
  final TextEditingController projectName0 = TextEditingController(text: projectName);
  final TextEditingController packageName0 = TextEditingController(text: packageName);
  final TextEditingController godevName0 = TextEditingController(text: godevName);
  return appShowModal(
    context: context,
    title: const Text("Edit Project", textAlign: TextAlign.center),
    content: SizedBox(
      width: Appsize.width(context) * 0.3,
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
                    controller: projectName0,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Project tidak boleh kosong';
                      }
                      return null; // valid
                    },
                  ),
                  AppTextfield(
                    label: "Nama Package",
                    controller: packageName0,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Package tidak boleh kosong';
                      }
                      return null; // valid
                    },
                  ),
                  AppTextfield(
                    label: "Nama Godev",
                    controller: godevName0,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Godev tidak boleh kosong';
                      }
                      return null; // valid
                    },
                  ),
                  Padding(
                    padding: Appsize.only(top: 20),
                    child: Container(
                      height: 150,
                      margin: Appsize.symetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          selectedImage != null
                              ? Container(
                                  margin: Appsize.symetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(File(selectedImage!.path), fit: BoxFit.cover)),
                                )
                              : Container(
                                  margin: Appsize.symetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network("${ConfigApi.baseImage}$logo", fit: BoxFit.fill)),
                                ),
                          AppTextButton(
                            backgroundColor: context.colorSchema.primary,
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              XFile? file = await picker.pickMedia();
                              setState(() {
                                selectedImage = file;
                              });
                            },
                            child: const Text(
                              "Change Image",
                            ),
                          )
                        ],
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
          projectName0.clear();
          packageName0.clear();
          godevName0.clear();
          Navigator.of(context).pop();
        },
      ),
      BlocConsumer<ProjectBloc, ProjectState>(
        listener: (context, state) {
          if (state is UpdateProjectLoaded) {
            Navigator.of(context).pop();
            context.read<ProjectBloc>().add(LoadProject(token!));
          }
        },
        builder: (context, state) {
          if (state is UpdateProjectLoading) {
            return const SizedBox(
              width: 80,
              child: WStateWaiting(),
            );
          }
          if (state is UpdateProjectLoaded) {
            return AppButton(
              isDisabled: true,
              width: 180,
              height: 50,
              widget: const Text("Submit"),
              onPressed: () {},
            );
          }
          if (state is UpdateProjectError) {
            return AppButton(
              width: 180,
              height: 50,
              widget: const Text("Submit"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ProjectBloc>().add(UpdateProject(
                        idProject: idProject!,
                        token: token!,
                        name: projectName0.text,
                        packageName: packageName0.text,
                        godevName: godevName0.text,
                        logo: selectedImage,
                      ));
                }
              },
            );
          }
          return AppButton(
            width: 180,
            height: 50,
            widget: const Text("Submit"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<ProjectBloc>().add(UpdateProject(
                      idProject: idProject!,
                      token: token!,
                      name: projectName0.text,
                      packageName: packageName0.text,
                      godevName: godevName0.text,
                      logo: selectedImage,
                    ));
              }
            },
          );
        },
      )
    ],
  );
}
