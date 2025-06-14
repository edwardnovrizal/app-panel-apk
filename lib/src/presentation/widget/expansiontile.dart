import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../config/size_config.dart';

class AppMenuExpansion extends StatelessWidget {
  const AppMenuExpansion({super.key, required this.children, required this.title, required this.icon});
  final List<Widget> children;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(icon, size: 18),
      dense: true,
      collapsedIconColor: context.colorSchema.onSurface,
      iconColor: context.colorSchema.onSurface,
      tilePadding: Appsize.symetric(horizontal: 10),
      childrenPadding: Appsize.symetric(horizontal: 15),
      collapsedBackgroundColor: Colors.transparent,
      shape: const Border(),
      title: Transform.translate(
        offset: const Offset(-10, 0),
        child: Text(
          title,
          style: context.styleText.titleLarge,
        ),
      ),
      children: children,
    );
  }
}
