import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/commons/navigate_handle.dart';
import 'package:panel_apk/src/config/route_config.dart';
import 'package:panel_apk/src/config/size_config.dart';

import '../../../../commons/shared_pref.dart';
import '../../../../config/api_config.dart';
import '../../../bloc/appinfo/appinfo_bloc.dart';
import '../../../widget/button.dart';
import '../../../widget/cache_image.dart';
import '../../../widget/snackbar.dart';
import '../../../widget/state_error.dart';
import '../../../widget/state_waiting.dart';
import 'appinfo_form_delete.dart';

class AppInfoTable extends StatelessWidget {
  final String token;
  const AppInfoTable({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppinfoBloc, AppinfoState>(
      listener: (context, state) {
        if (state is TokenExpiredState) {
          AppSharedPref.removeToken();
          NavigateHandle.byTypeRoute(context: context, typeRoute: TypeRoute.removeUntil, path: AppRoute.auth);
          appSnackbar(context, message: "Token Expired");
        }
      },
      builder: (context, state) {
        if (state is AppinfoLoading) {
          return const WStateWaiting();
        }
        if (state is AppinfoError) {
          return WStateError(message: state.msgError);
        }
        if (state is AppinfoSuccessRead) {
          return Expanded(
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              dividerThickness: 0.5,
              minWidth: 1000, // pastikan cukup luas untuk scroll horizontal
              headingRowColor: WidgetStateColor.resolveWith((states) => context.colorSchema.primary.withAlpha(100)),
              headingTextStyle: context.styleText.titleLarge,
              dataRowHeight: 56,
              columns: const [
                DataColumn2(label: Text('NO'), fixedWidth: 35),
                DataColumn2(label: Text('Thumbnail'), size: ColumnSize.S),
                DataColumn2(label: Text('Name'), size: ColumnSize.S),
                DataColumn2(label: Text('Version'), size: ColumnSize.S),
                DataColumn2(label: Text('Telegram'), size: ColumnSize.S),
                DataColumn2(label: Text('Whatsapp'), size: ColumnSize.S),
                DataColumn2(label: Text('Email'), size: ColumnSize.S),
                DataColumn2(label: Text('Action'), size: ColumnSize.M),
              ],
              empty: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                width: Appsize.width(context),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorSchema.primary.withAlpha(50), width: 1),
                ),
                child: Center(child: Text("---- Belum ada data ----", style: context.styleText.titleMedium)),
              ),
              rows: state.appInfoList.data.asMap().entries.map((e) {
                final index = e.key + 1;
                final item = e.value;
                return DataRow(
                  cells: [
                    DataCell(Text('$index')),
                    DataCell(
                      WCacheImage(
                        url: "${ConfigApi.baseImage}${item.thumbnail}",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    DataCell(Text(item.name)),
                    DataCell(Text(item.version)),
                    DataCell(Text(item.telegram)),
                    DataCell(Text(item.whatsapp)),
                    DataCell(Text(item.email)),
                    DataCell(Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 10,
                      children: [
                        AppButton(
                          width: 50,
                          backgroundColor: Colors.green,
                          widget: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        AppButton(
                          width: 50,
                          backgroundColor: Colors.redAccent,
                          widget: const Icon(Icons.delete),
                          onPressed: () {
                            appInfoFormDelete(context, appinfoId: item.id, projectId: item.projectId, token: token);
                          },
                        ),
                      ],
                    ))
                  ],
                );
              }).toList(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
