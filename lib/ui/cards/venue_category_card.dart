import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delmer/res/style.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({
    Key? key,
    required this.title,
    required this.asset,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => _CategoryView(this);
}

class _CategoryView extends StatelessView<CategoryComponent> {
  const _CategoryView(super.widget);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(5.0),
      child: ButtonTheme(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(4.0),
              height: 120.h,
              width: 140.w,
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.network(
                    widget.asset,
                    height: 32.0,
                    width: 32.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              widget.title,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
