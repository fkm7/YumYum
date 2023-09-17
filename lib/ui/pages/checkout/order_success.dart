import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({
    super.key,
    required this.trackMyOrder,
    required this.continueShopping,
  });

  final VoidCallback trackMyOrder;
  final VoidCallback continueShopping;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 96.0,
          ),
          SvgPicture.asset(
            AppAssets.success,
            height: 512.h,
            width: 512.w,
          ),
          Text(
            AppText.thankYouForYourOrder,
            style: AppTextStyle.titleStyle3.copyWith(
              color: AppColors.green,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            AppText.youCanTrackYouOrder,
            style: AppTextStyle.subTitleStyle2.copyWith(
              color: AppColors.green,
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
              onPressed: trackMyOrder,
              child: Text(
                AppText.trackMyOrder,
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 8.0,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                fixedSize: Size(1.sw, AppDimens.kButtonHeight),
              ),
              onPressed: continueShopping,
              child: Text(
                AppText.continueShopping,
                style: AppTextStyle.buttonStyle.copyWith(
                  color: AppColors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
