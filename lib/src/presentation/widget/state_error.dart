import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../config/size_config.dart';

class WStateError extends StatelessWidget {
  final String? message;
  const WStateError({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Appsize.symetric(horizontal: 10, vertical: 50),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: Appsize.only(bottom: 20),
            child: SvgPicture.asset(
              "assets/svg/state-error.svg",
              height: 200,
              alignment: Alignment.center,
            ),
          ),
          Text(
            message!,
            style: context.styleText.titleSmall,
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
