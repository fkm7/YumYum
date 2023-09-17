import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.ownerName,
    required this.color,
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String ownerName;
  final Color color;

  @override
  Widget build(BuildContext context) => _CreditCardView(this);
}

class _CreditCardView extends StatelessView<CreditCard> {
  const _CreditCardView(super.widget);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Card(
          color: widget.color,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                right: -4.0,
                bottom: 0,
                child: SvgPicture.asset(
                  AppAssets.waveLarge,
                  height: 320.h,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                left: 24.0,
                right: 24.0,
                top: 64.0,
                child: Text(
                  widget.cardNumber,
                  style: AppTextStyle.creditCardNumberStyle,
                ),
              ),
              Positioned(
                left: 24.0,
                bottom: 24.0,
                child: Text(
                  widget.ownerName,
                  style: AppTextStyle.subTitleStyle2.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 2,
                ),
              ),
              Positioned(
                right: 84.0,
                bottom: 24.0,
                child: RichText(
                  text: TextSpan(
                    text: 'EXP.END\n',
                    style: AppTextStyle.subTitleStyle0.copyWith(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: widget.expiryDate,
                        style: AppTextStyle.subTitleStyle2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
