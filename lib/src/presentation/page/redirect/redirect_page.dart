import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/redirect/widget/redirect_table.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';
import 'widget/redirect_form_create.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({super.key});

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _url = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppContentTitle(
          title: 'Notification Redirect',
          subtitle: 'Notifikasi yang muncul diaplikasi dalam bentuk page dam tidak bisa di tutup oleh pengguna',
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
              redirectFormCreate(
                context: context,
                formKey: _key,
                name: _title,
                desc: _desc,
                url: _url,
              );
            },
          ),
        ),
        const RedirectTable(),
      ],
    );
  }
}
