import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../widget/button.dart';
import '../../../widget/cache_image.dart';
import 'appinfo_form_delete.dart';

class AppInfoTable extends StatelessWidget {
  const AppInfoTable({super.key});

  @override
  Widget build(BuildContext context) {
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
          DataColumn2(label: Text('Thumbnail'), fixedWidth: 100),
          DataColumn2(label: Text('Version'), size: ColumnSize.M),
          DataColumn2(label: Text('Telegram'), size: ColumnSize.L),
          DataColumn2(label: Text('Whatsapp'), size: ColumnSize.M),
          DataColumn2(label: Text('Email'), size: ColumnSize.M),
          DataColumn2(label: Text('Action'), size: ColumnSize.S),
        ],
        rows: List<DataRow>.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              const DataCell(
                WCacheImage(
                  url: "https://panel.nopdev.cyou/uploads/logo-1749371786100-387441195.jpg",
                  width: 40,
                  height: 40,
                ),
              ),
              DataCell(Text('V1.1.0+${index + 1}')),
              DataCell(Text('@nopdev ${index + 1}')),
              DataCell(Text('+62812345678${index + 1}')),
              DataCell(Text('xxxx@gmail.com${index + 1}')),
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
                      appInfoFormDelete(context);
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
