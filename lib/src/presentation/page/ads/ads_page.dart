import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/page/ads/widget/ads_table.dart';
import 'package:panel_apk/src/presentation/page/ads/widget/modal_create_ads.dart';
import 'package:panel_apk/src/presentation/widget/content_title.dart';

import '../../widget/button.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({super.key});

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _appId = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _interstitial = TextEditingController();
  final TextEditingController _banner = TextEditingController();
  final TextEditingController _native = TextEditingController();
  final TextEditingController _appopen = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const AppContentTitle(
          title: 'Ads Network',
          subtitle: 'Tambahkan jenis iklan yang ingin anda gunakan',
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            height: 50,
            width: 150,
            widget: const Text(
              "Add New",
            ),
            onPressed: () {
              modalCreateAds(
                context: context,
                formKey: _key,
                nameController: _name,
                codeController: _code,
                descController: _desc,
                appidController: _appId,
                interController: _interstitial,
                bannerController: _banner,
                nativeController: _native,
                appopenController: _appopen,
              );
            },
          ),
        ),
        const AdsTable()
      ],
    );
  }
}
