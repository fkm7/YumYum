import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EmptyView extends StatelessView {
  const EmptyView(super.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.bag,
            height: 500.h,
            width: 1.sw,
          ),
          Text(
            AppText.cartEmpty,
            style: AppTextStyle.titleStyle0.copyWith(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 48.0,
            ),
            child: Text(
              AppText.lorem,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.green,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          SvgPicture.asset(
            AppAssets.horizontalWave,
            color: AppColors.green,
            height: 48.h,
            width: 1.sw,
          ),
        ],
      ),
    );
  }
}
