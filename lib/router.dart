import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/dash/dash_page.dart';
import 'package:panel_apk/src/presentation/page/login/login_page.dart';
import 'package:panel_apk/src/presentation/page/register/register_page.dart';
import 'package:panel_apk/src/presentation/page/setting/setting_page.dart';

import 'src/config/route_config.dart';
import 'src/domain/entities/argumen_entity.dart';
import 'src/presentation/page/auth/auth_page.dart';

class RouterGenerate {
  static Route<dynamic> build(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case AppRoute.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoute.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case AppRoute.dashboard:
        return MaterialPageRoute(builder: (_) => const DashPage());
      case AppRoute.setting:
        var arg = settings.arguments as ArgumentEntity;
        return MaterialPageRoute(builder: (_) => SettingPage(projectId: arg.projectId!));

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
