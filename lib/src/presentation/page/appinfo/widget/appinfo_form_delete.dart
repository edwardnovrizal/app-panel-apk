import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';
import 'package:panel_apk/src/presentation/widget/modal.dart';
import 'package:panel_apk/src/presentation/widget/state_waiting.dart';
import 'package:panel_apk/src/presentation/widget/text_button.dart';

import '../../../bloc/appinfo/appinfo_bloc.dart';

appInfoFormDelete(BuildContext context, {required String appinfoId, required String projectId, required String token}) {
  return appShowModal(
    context: context,
    title: const Text("Hapus Unit App Information", textAlign: TextAlign.center),
    content: Text(
      "Anda yakin ingin menghapus unit App Information ini?",
      textAlign: TextAlign.center,
      style: context.styleText.bodyMedium,
    ),
    actions: [
      AppTextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Batal"),
      ),
      BlocConsumer<AppinfoBloc, AppinfoState>(
        listener: (context, state) {
          if (state is AppInfoSuccessDelete) {
            Navigator.of(context).pop();
            context.read<AppinfoBloc>().add(ReadAppInfoEvent(token: token, projectId: projectId));
          }
        },
        builder: (context, state) {
          if (state is AppinfoLoadingDelete) {
            return const WStateWaiting(
              width: 100,
              size: 25,
            );
          }
          if (state is AppinfoErrorDelete) {
            return AppButton(
              onPressed: () {
                context.read<AppinfoBloc>().add(
                      DeleteAppinfoEvent(
                        projectId: projectId,
                        token: token,
                        appinfoId: appinfoId,
                      ),
                    );
              },
              width: 80,
              height: 50,
              widget: Text(
                "Hapus",
                style: context.styleText.titleLarge!.copyWith(
                  color: context.colorSchema.surface,
                ),
              ),
            );
          }
          if (state is AppInfoSuccessDelete) {
            return AppButton(
              onPressed: () {},
              isDisabled: true,
              width: 80,
              height: 50,
              widget: Text(
                "Hapus",
                style: context.styleText.titleLarge!.copyWith(
                  color: context.colorSchema.surface,
                ),
              ),
            );
          }
          return AppButton(
            onPressed: () {
              context.read<AppinfoBloc>().add(
                    DeleteAppinfoEvent(
                      projectId: projectId,
                      token: token,
                      appinfoId: appinfoId,
                    ),
                  );
            },
            width: 80,
            height: 50,
            widget: Text(
              "Hapus",
              style: context.styleText.titleLarge!.copyWith(
                color: context.colorSchema.surface,
              ),
            ),
          );
        },
      )
    ],
  );
}
