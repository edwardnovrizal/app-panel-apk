import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/widget/expansiontile.dart';
import 'package:panel_apk/src/presentation/widget/listtile.dart';
import 'package:panel_apk/src/presentation/widget/text_button.dart';

import '../../../../commons/enum.dart';
import '../../../widget/subexpansiontile.dart';

class SidebarSetting extends StatelessWidget {
  final SettingMenu selectedMenu;
  final Function(SettingMenu) onMenuSelected;

  const SidebarSetting({super.key, required this.selectedMenu, required this.onMenuSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AppTextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: context.colorSchema.primary,
                    size: 18,
                  ),
                  Text(
                    'Back',
                    style: context.styleText.titleLarge!.copyWith(
                      color: context.colorSchema.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppMenuItem(
            title: "Home",
            icon: Icons.dashboard,
            isSelected: selectedMenu == SettingMenu.home,
            onTap: () => onMenuSelected(SettingMenu.home),
          ),
          AppMenuItem(
            title: "Config",
            icon: Icons.settings,
            isSelected: selectedMenu == SettingMenu.config,
            onTap: () => onMenuSelected(SettingMenu.config),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('System',
                      style: context.styleText.headlineSmall!
                          .copyWith(color: context.colorSchema.onSurface.withAlpha(120))),
                ),
                Divider(
                  color: context.colorSchema.primary.withAlpha(50),
                  height: 0,
                  thickness: 1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                AppMenuItem(
                  title: "App Info",
                  icon: Icons.app_registration_rounded,
                  isSelected: selectedMenu == SettingMenu.appInfo,
                  onTap: () => onMenuSelected(SettingMenu.appInfo),
                ),
                AppMenuItem(
                  title: "Ads",
                  icon: Icons.monetization_on_rounded,
                  isSelected: selectedMenu == SettingMenu.ads,
                  onTap: () => onMenuSelected(SettingMenu.ads),
                ),
                AppMenuItem(
                  title: "Webview",
                  icon: Icons.open_in_browser,
                  isSelected: selectedMenu == SettingMenu.webview,
                  onTap: () => onMenuSelected(SettingMenu.webview),
                ),
                AppMenuItem(
                  title: "Deeplink",
                  icon: Icons.insert_link,
                  isSelected: selectedMenu == SettingMenu.deeplink,
                  onTap: () => onMenuSelected(SettingMenu.deeplink),
                ),
                AppMenuExpansion(
                  title: "Notification",
                  icon: Icons.notification_important,
                  children: [
                    AppSubMenuExpansiontile(
                      title: "Pop Up",
                      icon: Icons.copy_rounded,
                      isSelected: selectedMenu == SettingMenu.notifPopup,
                      onTap: () => onMenuSelected(SettingMenu.notifPopup),
                    ),
                    AppSubMenuExpansiontile(
                      title: "Redirect",
                      icon: Icons.directions,
                      isSelected: selectedMenu == SettingMenu.notifRedirect,
                      onTap: () => onMenuSelected(SettingMenu.notifRedirect),
                    ),
                  ],
                ),
                AppMenuExpansion(
                  title: "Blokir",
                  icon: Icons.block,
                  children: [
                    AppSubMenuExpansiontile(
                      title: "Ip",
                      icon: Icons.domain,
                      isSelected: selectedMenu == SettingMenu.blockIp,
                      onTap: () => onMenuSelected(SettingMenu.blockIp),
                    ),
                    AppSubMenuExpansiontile(
                      title: "Country",
                      icon: Icons.flag,
                      isSelected: selectedMenu == SettingMenu.blockCountry,
                      onTap: () => onMenuSelected(SettingMenu.blockCountry),
                    ),
                    AppSubMenuExpansiontile(
                      title: "Country Code",
                      icon: Icons.location_city,
                      isSelected: selectedMenu == SettingMenu.blockCountryCode,
                      onTap: () => onMenuSelected(SettingMenu.blockCountryCode),
                    ),
                    AppSubMenuExpansiontile(
                      title: "ASN",
                      icon: Icons.horizontal_distribute,
                      isSelected: selectedMenu == SettingMenu.blockAsn,
                      onTap: () => onMenuSelected(SettingMenu.blockAsn),
                    ),
                    AppSubMenuExpansiontile(
                      title: "Organization",
                      icon: Icons.business_center_sharp,
                      isSelected: selectedMenu == SettingMenu.blockOrganization,
                      onTap: () => onMenuSelected(SettingMenu.blockOrganization),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Client',
                    style: context.styleText.headlineSmall!.copyWith(
                      color: context.colorSchema.onSurface.withAlpha(120),
                    ),
                  ),
                ),
                Divider(
                  color: context.colorSchema.primary.withAlpha(50),
                  height: 0,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
