import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/navigate_handle.dart';
import 'package:panel_apk/src/commons/shared_pref.dart';
import 'package:panel_apk/src/config/route_config.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/page/dash/widget/heading_project.dart';
import 'package:panel_apk/src/presentation/page/dash/widget/table_project.dart';

import '../../bloc/project/project_bloc.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  String? token;

  @override
  void initState() {
    super.initState();
    token = AppSharedPref.getToken();
    context.read<ProjectBloc>().add(LoadProject(token!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel APK"),
        actions: [
          Padding(
            padding: Appsize.symetric(horizontal: 20),
            child: PopupMenuButton(
              icon: const Icon(Icons.person),
              onSelected: (value) {
                if (value == "/logout") {
                  AppSharedPref.removeToken();
                  NavigateHandle.byTypeRoute(context: context, typeRoute: TypeRoute.removeUntil, path: AppRoute.auth);
                }
              },
              itemBuilder: (BuildContext bc) {
                return const [
                  PopupMenuItem(
                    value: '/logout',
                    child: Text("Keluar"),
                  ),
                ];
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: Appsize.symetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WHeadingProject(token: token!),
            WTableProject(token: token!),
          ],
        ),
      ),
    );
  }
}
