import 'package:flutter/material.dart';

import 'loading_circle.dart';

class WStateWaiting extends StatelessWidget {
  final double? width;
  final double? size;
  const WStateWaiting({super.key, this.width, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, child: Center(child: AppLoading(size: size ?? 30)));
  }
}
