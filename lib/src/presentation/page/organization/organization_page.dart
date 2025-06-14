import 'package:flutter/material.dart';

import '../../widget/button.dart';
import '../../widget/content_title.dart';
import 'widget/organization_form_create.dart';
import 'widget/organization_table.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({super.key});

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const AppContentTitle(
          title: 'Organization',
          subtitle: 'Daftar blokir user berdasarkan organization',
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
              organizationFormCreate(context: context, formKey: _key, name: _name);
            },
          ),
        ),
        const OrganizationTable(),
      ],
    );
  }
}
