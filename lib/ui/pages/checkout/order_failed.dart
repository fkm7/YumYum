import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderFailed extends StatelessWidget {
  const OrderFailed({super.key, required this.tryAgain});

  final VoidCallback tryAgain;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 180.h,
          ),
          SvgPicture.asset(
            AppAssets.failed,
            height: 512.h,
            width: 512.w,
          ),
          Text(
            AppText.orderFailed,
            style: AppTextStyle.titleStyle3.copyWith(
              color: AppColors.red,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            AppText.smthWentWrong,
            style: AppTextStyle.subTitleStyle2.copyWith(
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 8.0,
            ),
            child: GradientButton(
              onPressed: tryAgain,
              child: Text(
                AppText.tryAgain,
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
