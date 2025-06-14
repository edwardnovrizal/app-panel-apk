import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';

class AppSubMenuExpansiontile extends StatelessWidget {
  const AppSubMenuExpansiontile(
      {super.key, required this.title, required this.icon, this.onTap, required this.isSelected});
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      contentPadding: Appsize.symetric(horizontal: 8),
      hoverColor: context.colorSchema.primary.withAlpha(30),
      iconColor: context.colorSchema.onSurface,
      selectedTileColor: context.colorSchema.primary.withAlpha(50),
      mouseCursor: MouseCursor.uncontrolled,
      horizontalTitleGap: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      leading: Icon(icon, size: 18),
      minVerticalPadding: 15,
      title: Text(
        title,
        style: context.styleText.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}
