import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/page/setting/widget/content.dart';

import '../../../commons/shared_pref.dart';
import '../../bloc/appinfo/appinfo_bloc.dart';
import 'widget/sidebar.dart';

class SettingPage extends StatefulWidget {
  final String projectId;
  const SettingPage({super.key, required this.projectId});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SettingMenu selectedMenu = SettingMenu.home;
  String? token;

  void _handleMenuChange(SettingMenu menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  @override
  void initState() {
    token = AppSharedPref.getToken();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppinfoBloc>().add(ReadAppInfoEvent(token: token!, projectId: widget.projectId));
    });
    super.initState();
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
              child: ContentBar(
                menu: selectedMenu,
                projectId: widget.projectId,
                token: token!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
