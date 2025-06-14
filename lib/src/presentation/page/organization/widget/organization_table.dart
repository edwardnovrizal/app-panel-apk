import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../../widget/button.dart';
import 'organization_form_delete.dart';

class OrganizationTable extends StatelessWidget {
  const OrganizationTable({super.key});

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
        fixedLeftColumns: 1,
        dataRowHeight: 56,
        columns: const [
          DataColumn2(label: Text('NO'), fixedWidth: 50, headingRowAlignment: MainAxisAlignment.center),
          DataColumn2(label: Text('Organization'), size: ColumnSize.L, headingRowAlignment: MainAxisAlignment.center),
          DataColumn2(label: Text('Action'), fixedWidth: 150, headingRowAlignment: MainAxisAlignment.center),
        ],
        rows: List<DataRow>.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Center(child: Text('${index + 1}'))),
              DataCell(Center(child: Text('PT. TELKOM JAYA KUSUMA${index + 1}'))),
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
                      oranizationFormDelete(context);
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
