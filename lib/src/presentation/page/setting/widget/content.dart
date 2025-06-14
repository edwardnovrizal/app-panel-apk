import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/presentation/page/ads/ads_page.dart';
import 'package:panel_apk/src/presentation/page/appinfo/appinfo_page.dart';
import 'package:panel_apk/src/presentation/page/asn/asn_page.dart';
import 'package:panel_apk/src/presentation/page/country/country_page.dart';
import 'package:panel_apk/src/presentation/page/country_code/country_code_page.dart';
import 'package:panel_apk/src/presentation/page/deeplink/deeplink_page.dart';
import 'package:panel_apk/src/presentation/page/home/home_page.dart';
import 'package:panel_apk/src/presentation/page/ip/ip_page.dart';
import 'package:panel_apk/src/presentation/page/organization/organization_page.dart';
import 'package:panel_apk/src/presentation/page/popup/popup_page.dart';
import 'package:panel_apk/src/presentation/page/redirect/redirect_page.dart';
import 'package:panel_apk/src/presentation/page/webview/webview_page.dart';

class ContentBar extends StatelessWidget {
  const ContentBar({super.key, required this.menu});
  final SettingMenu menu;

  @override
  Widget build(BuildContext context) {
    switch (menu) {
      case SettingMenu.home:
        return const HomePage();
      case SettingMenu.appInfo:
        return const AppInfoPage();
      case SettingMenu.ads:
        return const AdsPage();
      case SettingMenu.webview:
        return const WebviewPage();
      case SettingMenu.deeplink:
        return const DeeplinkPage();
      case SettingMenu.notifPopup:
        return const PopupPage();
      case SettingMenu.notifRedirect:
        return const RedirectPage();
      case SettingMenu.blockIp:
        return const IpPage();
      case SettingMenu.blockCountry:
        return const CountryPage();
      case SettingMenu.blockCountryCode:
        return const CountryCodePage();
      case SettingMenu.blockAsn:
        return const AsnPage();
      case SettingMenu.blockOrganization:
        return const OrganizationPage();

      default:
        return const Center(child: Text("Belum ada konten."));
    }
  }
}
