import 'package:flutter/material.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';
import 'widget/country_code_form_create.dart';
import 'widget/country_code_table.dart';

class CountryCodePage extends StatefulWidget {
  const CountryCodePage({super.key});

  @override
  State<CountryCodePage> createState() => _CountryCodePageState();
}

class _CountryCodePageState extends State<CountryCodePage> {
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
              countryCodeFormCreate(context);
            },
          ),
        ),
        const CountryCodeTable(),
      ],
    );
  }
}
