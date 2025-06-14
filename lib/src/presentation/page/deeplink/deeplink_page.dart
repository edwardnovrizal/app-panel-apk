import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/deeplink/widget/deeplink_form_create.dart';
import 'package:panel_apk/src/presentation/page/deeplink/widget/deeplink_table.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';

class DeeplinkPage extends StatefulWidget {
  const DeeplinkPage({super.key});

  @override
  State<DeeplinkPage> createState() => _DeeplinkPageState();
}

class _DeeplinkPageState extends State<DeeplinkPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _package = TextEditingController();
  final TextEditingController _scheme = TextEditingController();
  final TextEditingController _path = TextEditingController();
  final TextEditingController _query = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppContentTitle(
            title: 'Deeplink', subtitle: 'Daftar Deeplink untuk mengakses aplikasi lain melalui aplikasi anda'),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            height: 50,
            width: 150,
            widget: const Text(
              "Add New",
            ),
            onPressed: () {
              deeplinkFormCreate(
                context: context,
                formKey: _key,
                name: _name,
                package: _package,
                scheme: _scheme,
                path: _path,
                query: _query,
              );
            },
          ),
        ),
        const DeeplinkTable()
      ],
    );
  }
}
