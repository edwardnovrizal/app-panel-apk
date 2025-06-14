import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/page/ads/widget/modal_delete_ads.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';

class AdsTable extends StatelessWidget {
  const AdsTable({super.key});

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
          DataColumn2(label: Text('Name'), size: ColumnSize.S),
          DataColumn2(label: Text('Desc'), size: ColumnSize.L),
          DataColumn2(label: Text('App ID'), size: ColumnSize.L),
          DataColumn2(label: Text('Interstitial'), size: ColumnSize.L),
          DataColumn2(label: Text('Banner'), size: ColumnSize.L),
          DataColumn2(label: Text('Native'), size: ColumnSize.L),
          DataColumn2(label: Text('App Open'), size: ColumnSize.L),
          DataColumn2(label: Text('Action'), size: ColumnSize.M),
        ],
        rows: List<DataRow>.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(Text('Admob ${index + 1}')),
              DataCell(Text('akun admob yang baru dibikin dan belum ada pin di email xxxxxxx@gmail.com ${index + 1}')),
              DataCell(Text('ca-app-pub-3940256099942544~3347511713${index + 1}')),
              const DataCell(Text('ca-app-pub-3940256099942544/1033173712')),
              const DataCell(Text('ca-app-pub-3940256099942544/6300978111')),
              const DataCell(Text('ca-app-pub-3940256099942544/2247696110')),
              const DataCell(Text('ca-app-pub-3940256099942544/9257395921')),
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
                      modalDeleteAds(context: context, idProject: '', token: 'token');
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
