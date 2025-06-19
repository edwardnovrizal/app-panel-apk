import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/widget/content_title.dart';

import '../../widget/button.dart';
import 'widget/appinfo_table.dart';
import 'widget/create/create_dialog.dart';

class AppInfoPage extends StatefulWidget {
  final String projectId;
  final String token;
  const AppInfoPage({super.key, required this.projectId, required this.token});

  @override
  State<AppInfoPage> createState() => _AppInfoPageState();
}

class _AppInfoPageState extends State<AppInfoPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _thumbnail = TextEditingController();
  final TextEditingController _version = TextEditingController();
  final TextEditingController _telegram = TextEditingController();
  final TextEditingController _whatsapp = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const AppContentTitle(
          title: 'Informasi Aplikasi',
          subtitle: 'Informasi yang berhubungan dengan aplikasi APK Anda',
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            height: 50,
            width: 150,
            widget: const Text(
              "Add New",
            ),
            onPressed: () {
              showAppInfoFormDialog(
                context: context,
                formKey: _key,
                projectId: widget.projectId,
                token: widget.token,
                name: _name,
                title: _title,
                thumbnail: _thumbnail,
                version: _version,
                telegram: _telegram,
                whatsapp: _whatsapp,
                email: _email,
              );
            },
          ),
        ),
        AppInfoTable(token: widget.token),
      ],
    );
  }
}
