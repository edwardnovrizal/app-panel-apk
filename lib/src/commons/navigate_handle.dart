import 'package:flutter/material.dart';
import 'package:panel_apk/src/config/route_config.dart';
import 'package:panel_apk/src/domain/entities/argumen_entity.dart';

import 'enum.dart';

class NavigateHandle {
  static byTypeRoute({
    required BuildContext context,
    required TypeRoute typeRoute,
    required String path,
    String? token,
    String? projectId,
  }) {
    if (typeRoute == TypeRoute.push) {
      return Navigator.pushNamed(
        context,
        path,
        arguments: ArgumentEntity(projectId: projectId),
      );
    } else if (typeRoute == TypeRoute.replace) {
      return Navigator.pushReplacementNamed(
        context,
        path,
      );
    } else if (typeRoute == TypeRoute.removeUntil) {
      return Navigator.pushNamedAndRemoveUntil(
        context,
        path,
        (route) => false,
      );
    } else {
      return Navigator.pushNamed(context, AppRoute.dashboard);
    }
  }
}
