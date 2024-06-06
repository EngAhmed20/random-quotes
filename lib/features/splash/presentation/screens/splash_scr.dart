import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_clean/core/utils/app_route.dart';

import '../../../../core/utils/app_assets.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({Key? key}) : super(key: key);

  @override
  State<SplashScr> createState() => _SplashScrState();
}

late Timer _timer;

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Image.asset(ImgAssets.logo),
    ));
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 4000),
        () => GoRouter.of(context).pushReplacement(AppRoute.KHome));
  }
}
/**/