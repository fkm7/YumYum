import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
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
  Widget build(BuildContext context) => _GradientButtonView(this);
}

class _GradientButtonView extends StatelessView<GradientButton> {
  const _GradientButtonView(super.widget);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // surfaceTintColor: AppColors.green,
        // shadowColor: AppColors.green,
        // foregroundColor: AppColors.greenLight,
        // backgroundColor: AppColors.greenLight,
        fixedSize: Size(
            widget.width ?? double.infinity, widget.height ?? AppDimens.kButtonHeight,),
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
      onPressed: widget.onPressed,
      child: Stack(
        children: [
          Ink(
            height: widget.height,
            width: widget.width,
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              gradient: widget.gradient ??
                  const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.greenLight,
                      AppColors.green,
                    ],
                  ),
              boxShadow: kElevationToShadow[1],
            ),
            child: Center(child: widget.child),
          ),
          Positioned(
            right: 16.0,
            bottom: 0,
            child: SvgPicture.asset(
              AppAssets.wave,
              fit: BoxFit.cover,
              height: 48.0,
              width: 48.0,
              alignment: Alignment.center,
              allowDrawingOutsideViewBox: false,
            ),
          ),
        ],
      ),
    );
  }
}
