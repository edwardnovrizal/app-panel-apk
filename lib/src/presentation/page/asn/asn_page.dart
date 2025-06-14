import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/asn/widget/asn_table.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';
import 'widget/asn_form_create.dart';

class AsnPage extends StatefulWidget {
  const AsnPage({super.key});

  @override
  State<AsnPage> createState() => _AsnPageState();
}

class _AsnPageState extends State<AsnPage> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const AppContentTitle(
          title: 'ASN',
          subtitle: 'Daftar blokir user berdasarkan ASN',
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
              asnFormCreate(context: context, formKey: _key, name: _name);
            },
          ),
        ),
        const AsnTable(),
      ],
    );
  }
}
