import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/ip/widget/ip_table.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';
import 'widget/ip_form_create.dart';

class IpPage extends StatefulWidget {
  const IpPage({super.key});

  @override
  State<IpPage> createState() => _IpPageState();
}

class _IpPageState extends State<IpPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _value = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppContentTitle(
          title: 'Ip Address',
          subtitle: 'Daftar blokir user berdasarkan ip address',
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
              blokirIpFormCreate(context: context, formKey: _key, name: _name, value: _value);
            },
          ),
        ),
        const IpTable()
      ],
    );
  }
}
