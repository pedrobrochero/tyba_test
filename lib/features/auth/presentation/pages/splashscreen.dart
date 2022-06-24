import 'dart:math';

import 'package:flutter/material.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = min(size.height, size.width);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(
                size: logoSize * .7,
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
