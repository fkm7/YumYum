import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/pages/cart/cart.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.cost,
    required this.productsCount,
  });

  final double cost;
  final int productsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 12.0,
        bottom: 32.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.fillColor,
        border: Border(
          top: BorderSide(
            color: AppColors.dotColor,
            width: 2.0,
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          context.push(
            CartPage.route,
            extra: {'canPop': true},
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          fixedSize: const Size(double.infinity, AppDimens.kButtonHeight),
          alignment: Alignment.center,
        ),
        child: Stack(
          children: [
            Ink(
              height: AppDimens.kButtonHeight,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                gradient: LinearGradient(
                  colors: [
                    AppColors.greenLight,
                    AppColors.green,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currencyFormatter.format(cost),
                    style: AppTextStyle.subTitleStyle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AppText.viewCart,
                    style: AppTextStyle.buttonStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$productsCount',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16.0,
              bottom: 0,
              child: SvgPicture.asset(
                AppAssets.wave,
                fit: BoxFit.cover,
                height: 48.0,
                width: 48.0,
                allowDrawingOutsideViewBox: false,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
