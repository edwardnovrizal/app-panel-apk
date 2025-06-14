import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/page/redirect/widget/redirect_form_delete.dart';

import '../../../widget/button.dart';
import '../../../widget/cache_image.dart';

class RedirectTable extends StatelessWidget {
  const RedirectTable({super.key});

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
          DataColumn2(label: Text('Title'), size: ColumnSize.M),
          DataColumn2(label: Text('Description'), size: ColumnSize.L),
          DataColumn2(label: Text('URL'), size: ColumnSize.M),
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
              DataCell(Text('ca-app-pub-3940256099942544~3347511713${index + 1}')),
              DataCell(Text('akun admob yang baru dibikin dan belum ada pin di email xxxxxxx@gmail.com ${index + 1}')),
              DataCell(Text('https://google.com${index + 1}')),
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
                      redirectFormDelete(context);
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
