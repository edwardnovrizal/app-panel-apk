import 'package:flutter/material.dart';

import 'loading_circle.dart';

class WStateWaiting extends StatelessWidget {
  const WStateWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppLoading());
  }
}
