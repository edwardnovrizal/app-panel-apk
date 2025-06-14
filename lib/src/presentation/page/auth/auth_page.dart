import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/navigate_handle.dart';
import 'package:panel_apk/src/commons/shared_pref.dart';
import 'package:panel_apk/src/config/route_config.dart';
import 'package:panel_apk/src/presentation/widget/loading_circle.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadToken();
    });
  }

  void _loadToken() {
    String? token = AppSharedPref.getToken();
    if (token != null) {
      if (!mounted) return;
      NavigateHandle.byTypeRoute(
        context: context,
        typeRoute: TypeRoute.removeUntil,
        path: AppRoute.dashboard,
        token: token,
      );
    } else {
      if (!mounted) return;
      NavigateHandle.byTypeRoute(
        context: context,
        typeRoute: TypeRoute.removeUntil,
        path: AppRoute.login,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLoading(),
      ),
    );
  }
}
