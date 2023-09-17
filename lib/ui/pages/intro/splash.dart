import 'package:delmer/res/assets.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const route = '/splash';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 1.sw,
        height: 1.sh,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.splashWave,
              color: Colors.white,
              height: 256.h,
              width: 256.w,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              AppText.appName,
              style: AppTextStyle.headerLargeStyle.copyWith(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: .15.sw,
              ),
              child: SvgPicture.asset(
                AppAssets.horizontalWave,
                color: Colors.white,
                height: 128.h,
                width: 1.sw,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
