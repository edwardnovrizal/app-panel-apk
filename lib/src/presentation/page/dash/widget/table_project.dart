import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/commons/navigate_handle.dart';
import 'package:panel_apk/src/commons/shared_pref.dart';
import 'package:panel_apk/src/config/api_config.dart';
import 'package:panel_apk/src/config/route_config.dart';
import 'package:panel_apk/src/presentation/page/dash/widget/modal_delete.dart';
import 'package:panel_apk/src/presentation/page/dash/widget/modal_edit.dart';
import 'package:panel_apk/src/presentation/widget/snackbar.dart';

import '../../../bloc/project/project_bloc.dart';
import '../../../widget/button.dart';
import '../../../widget/cache_image.dart';
import '../../../widget/state_error.dart';
import '../../../widget/state_waiting.dart';

class WTableProject extends StatefulWidget {
  final String token;
  const WTableProject({super.key, required this.token});

  @override
  State<WTableProject> createState() => _WTableProjectState();
}

class _WTableProjectState extends State<WTableProject> {
  bool isTyping = false;
  bool isSelected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is TokenExpiredState) {
          AppSharedPref.removeToken();
          NavigateHandle.byTypeRoute(context: context, typeRoute: TypeRoute.removeUntil, path: AppRoute.auth);
          appSnackbar(context, message: "Token Expired");
        }
      },
      builder: (context, state) {
        if (state is ProjectLoading) {
          return const WStateWaiting();
        }
        if (state is ProjectError) {
          return WStateError(message: state.msgError);
        }
        if (state is ProjectLoaded) {
          return Expanded(
            child: DataTable2(
                headingRowColor: WidgetStateColor.resolveWith((states) => context.colorSchema.primary.withAlpha(100)),
                headingTextStyle: context.styleText.titleLarge,
                columnSpacing: 12,
                dividerThickness: 0.5,
                horizontalMargin: 12,
                isHorizontalScrollBarVisible: true,
                isVerticalScrollBarVisible: true,
                dataRowHeight: 60,
                columns: const [
                  DataColumn2(
                    fixedWidth: 50,
                    label: Text('NO'),
                  ),
                  DataColumn2(
                    fixedWidth: 120,
                    label: Text('Image'),
                  ),
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Package Name'),
                  ),
                  DataColumn(
                    label: Text('Dev Name'),
                  ),
                  DataColumn(
                    label: Text('Actions'),
                  ),
                ],
                rows: state.projects.data.asMap().entries.map((e) {
                  final index = e.key + 1;
                  final item = e.value;
                  return DataRow(
                    cells: [
                      DataCell(Text("$index", style: context.styleText.bodySmall)),
                      DataCell(WCacheImage(
                        url: "${ConfigApi.baseImage}${item.logo}",
                        width: 40,
                        height: 40,
                      )),
                      DataCell(
                        onTap: () {
                          NavigateHandle.byTypeRoute(
                            context: context,
                            typeRoute: TypeRoute.push,
                            path: AppRoute.setting,
                            projectId: item.id,
                          );
                        },
                        Text(
                          item.name,
                          style: context.styleText.bodySmall,
                        ),
                      ),
                      DataCell(
                        onTap: () {
                          NavigateHandle.byTypeRoute(
                            context: context,
                            typeRoute: TypeRoute.push,
                            path: AppRoute.setting,
                            projectId: item.id,
                          );
                        },
                        Text(
                          item.packageName,
                          style: context.styleText.bodySmall!.copyWith(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataCell(onTap: () {
                        NavigateHandle.byTypeRoute(
                          context: context,
                          typeRoute: TypeRoute.push,
                          path: AppRoute.setting,
                          projectId: item.id,
                        );
                      },
                          Text(
                            item.godevName,
                            style: context.styleText.bodySmall,
                          )),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          AppButton(
                            widget: const Icon(Icons.edit),
                            backgroundColor: Colors.green,
                            width: 40,
                            onPressed: () {
                              modalEdit(
                                context: context,
                                formKey: _formKey,
                                token: widget.token,
                                projectName: item.name,
                                packageName: item.packageName,
                                godevName: item.godevName,
                                logo: item.logo,
                                idProject: item.id,
                              );
                            },
                          ),
                          AppButton(
                            widget: const Icon(
                              Icons.delete,
                            ),
                            backgroundColor: Colors.redAccent,
                            width: 40,
                            onPressed: () {
                              modalDelete(context: context, idProject: item.id, token: widget.token);
                            },
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList()),
          );
        }
        return Container();
      },
    );
  }
}
