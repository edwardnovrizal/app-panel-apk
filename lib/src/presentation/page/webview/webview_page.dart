import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/webview/widget/webview_form_create.dart';
import 'package:panel_apk/src/presentation/page/webview/widget/webview_table.dart';
import 'package:panel_apk/src/presentation/widget/content_title.dart';

import '../../widget/button.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _url = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppContentTitle(title: 'URL Webview', subtitle: 'Daftar URL Webview yang dapat dibuka melalui aplikasi'),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            height: 50,
            width: 150,
            widget: const Text(
              "Add New",
            ),
            onPressed: () {
              webviewFormCreate(
                context: context,
                formKey: _key,
                name: _name,
                desc: _desc,
                url: _url,
              );
            },
          ),
        ),
        const WebviewTable()
      ],
    );
  }
}
