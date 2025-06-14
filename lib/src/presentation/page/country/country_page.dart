import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/country/widget/country_form_create.dart';
import 'package:panel_apk/src/presentation/page/country/widget/country_table.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const AppContentTitle(
          title: 'Country',
          subtitle: 'Daftar blokir user berdasarkan Country',
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            height: 50,
            width: 150,
            widget: const Text(
              "Add New",
            ),
            onPressed: () {
              countryFormCreate(context);
            },
          ),
        ),
        const CountryTable(),
      ],
    );
  }
}
