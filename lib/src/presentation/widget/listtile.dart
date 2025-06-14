import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/config/size_config.dart';

class AppMenuItem extends StatelessWidget {
  const AppMenuItem({super.key, required this.title, required this.icon, this.onTap, required this.isSelected});
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListTile(
        selected: isSelected,
        contentPadding: Appsize.symetric(horizontal: 10),
        hoverColor: context.colorSchema.primary.withAlpha(30),
        mouseCursor: MouseCursor.uncontrolled,
        selectedTileColor: context.colorSchema.primary.withAlpha(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        minVerticalPadding: 15,
        leading: Icon(icon, size: 18),
        horizontalTitleGap: 5,
        title: Text(
          title,
          style: context.styleText.titleLarge,
        ),
        onTap: onTap,
      ),
    );
  }
}
