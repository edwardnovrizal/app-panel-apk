import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/page/setting/widget/content.dart';

import 'widget/sidebar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SettingMenu selectedMenu = SettingMenu.home;

  void _handleMenuChange(SettingMenu menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: 300,
            padding: Appsize.symetric(horizontal: 0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: context.colorSchema.primary.withAlpha(50),
                  width: 1,
                ),
              ),
            ),
            child: SidebarSetting(
              selectedMenu: selectedMenu,
              onMenuSelected: (menu) => _handleMenuChange(menu),
            ),
          ),
          Expanded(
            child: Padding(
              padding: Appsize.symetric(horizontal: 10, vertical: 10),
              child: ContentBar(menu: selectedMenu),
            ),
          ),
        ],
      ),
    );
  }
}
