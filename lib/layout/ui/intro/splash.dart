import 'dart:async';

import 'package:delmer/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/layout/ui/intro/intro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushNamed(context, IntroPage.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.greenLight,
            AppColors.green,
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          AppAssets.logo,
          height: 512.h,
          width: 512.w,
        ),
      ),
    );
  }
}
