import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/page/deeplink/widget/deeplink_form_delete.dart';

import '../../../widget/button.dart';

class DeeplinkTable extends StatelessWidget {
  const DeeplinkTable({super.key});

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
          DataColumn2(label: Text('NO'), fixedWidth: 50),
          DataColumn2(label: Text('Name'), size: ColumnSize.M),
          DataColumn2(label: Text('Package Name'), size: ColumnSize.L),
          DataColumn2(label: Text('Scheme'), size: ColumnSize.M),
          DataColumn2(label: Text('Path'), size: ColumnSize.M),
          DataColumn2(label: Text('Query'), size: ColumnSize.M),
          DataColumn2(label: Text('Action'), size: ColumnSize.S),
        ],
        rows: List<DataRow>.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text('Admob ${index + 1}')),
              DataCell(Text('com.fb.meta${index + 1}')),
              DataCell(Text('goplayer${index + 1}')),
              DataCell(Text('stream${index + 1}')),
              DataCell(Text('live${index + 1}')),
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
                      deeplinkFormDelete(context);
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
