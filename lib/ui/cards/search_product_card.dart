import 'package:cached_network_image/cached_network_image.dart';
import 'package:delmer/model/product.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({
    super.key,
    required this.product,
    required this.onPressed,
  });

  final Product product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(900.w, 150.h)),
        child: Row(
          children: [
            Container(
              width: 180.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: AppColors.dotColor,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTextStyle.titleStyle0.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    currencyFormatter.format(product.price),
                    style: AppTextStyle.subTitleStyle2,
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.grey,
                  size: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
