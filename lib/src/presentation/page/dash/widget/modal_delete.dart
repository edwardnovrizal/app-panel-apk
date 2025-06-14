import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../bloc/project/project_bloc.dart';
import '../../../widget/button.dart';
import '../../../widget/modal.dart';
import '../../../widget/snackbar.dart';
import '../../../widget/state_waiting.dart';
import '../../../widget/text_button.dart';

modalDelete({
  required BuildContext context,
  required String idProject,
  required String token,
}) {
  return appShowModal(
      context: context,
      title: const Text("Hapus Project", textAlign: TextAlign.center),
      content: Text(
        "Anda yakin ingin menghapus project ini?",
        textAlign: TextAlign.center,
        style: context.styleText.bodyMedium,
      ),
      actions: [
        AppTextButton(child: const Text("Batal"), onPressed: () => Navigator.of(context).pop()),
        BlocConsumer<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is DeleteProjectLoaded) {
              Navigator.of(context).pop();
              appSnackbar(context, message: "Project berhasil dihapus");
              context.read<ProjectBloc>().add(LoadProject(token));
            }
          },
          builder: (context, state) {
            if (state is DeleteProjectLoaded) {
              return AppButton(
                width: 80,
                height: 50,
                widget: Text(
                  "Hapus",
                  style: context.styleText.titleLarge!.copyWith(
                    color: context.colorSchema.surface,
                  ),
                ),
                onPressed: () {},
              );
            }
            if (state is DeleteProjectLoading) {
              return const SizedBox(
                width: 80,
                child: WStateWaiting(),
              );
            }
            if (state is DeleteProjectError) {
              return AppButton(
                width: 80,
                height: 50,
                widget: Text(
                  "Hapus",
                  style: context.styleText.titleLarge!.copyWith(
                    color: context.colorSchema.surface,
                  ),
                ),
                onPressed: () {
                  context.read<ProjectBloc>().add(DeleteProject(token: token, idProject: idProject));
                },
              );
            }
            return AppButton(
              width: 80,
              height: 50,
              widget: Text(
                "Hapus",
                style: context.styleText.titleLarge!.copyWith(
                  color: context.colorSchema.surface,
                ),
              ),
              onPressed: () {
                context.read<ProjectBloc>().add(DeleteProject(token: token, idProject: idProject));
              },
            );
          },
        )
      ]);
}
