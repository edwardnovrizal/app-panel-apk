import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/widget/content_title.dart';

import 'widget/appinfo_table.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppContentTitle(
          title: 'Informasi Aplikasi',
          subtitle: 'Informasi yang berhubungan dengan aplikasi APK Anda',
        ),
        const SizedBox(height: 20),
        const AppInfoTable(),
      ],
    );
  }
}
