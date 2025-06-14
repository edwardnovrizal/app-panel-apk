import 'package:flutter/material.dart';
import 'package:panel_apk/src/presentation/widget/content_title.dart';
import 'package:panel_apk/src/presentation/widget/content_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppContentTitle(
          title: "Home",
          subtitle:
              'Selamat datang di Panel APK Anda! Di sini Anda dapat mengelola proyek dan aplikasi Android Anda dengan mudah.',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: [
              AppContentWidget(),
              AppContentWidget(),
              AppContentWidget(),
            ],
          ),
        )
      ],
    );
  }
}
