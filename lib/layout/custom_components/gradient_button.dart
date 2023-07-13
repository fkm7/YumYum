import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.gradient,
    this.height,
    this.width,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Gradient? gradient;
  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        surfaceTintColor: AppColors.green,
        shadowColor: AppColors.green,
        foregroundColor: AppColors.greenLight,
        backgroundColor: AppColors.greenLight,
        fixedSize: Size(width ?? double.infinity, height ?? 56.0),
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: onPressed,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              gradient: gradient ??
                  const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.greenLight,
                      AppColors.green,
                    ],
                  ),
              boxShadow: kElevationToShadow[6],
            ),
            child: child,
          ),
          Positioned(
            right: 24,
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
    );
  }
}
