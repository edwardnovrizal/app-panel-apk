import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/popup/widget/popup_table.dart';
import 'package:panel_apk/src/presentation/widget/content_title.dart';

import '../../widget/button.dart';
import 'widget/popup_form_create.dart';

class PopupPage extends StatefulWidget {
  const PopupPage({super.key});

  @override
  State<PopupPage> createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
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
          title: 'Notification Pop Up',
          subtitle: 'Notifikasi yang muncul diaplikasi dalam bentuk popup dan masih bisa di tutup oleh pengguna',
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
              popupFormCreate(
                context: context,
                formKey: _key,
                name: _title,
                desc: _desc,
                url: _url,
              );
            },
          ),
        ),
        const PopupTable(),
      ],
    );
  }
}
