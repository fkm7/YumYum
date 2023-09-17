import 'package:delmer/model/product.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartVenueCard extends StatelessWidget {
  const CartVenueCard({
    super.key,
    required this.count,
    required this.product,
    required this.decreaseCount,
    required this.increaseCount,
  });

  final int count;
  final Product product;
  final VoidCallback decreaseCount;
  final VoidCallback increaseCount;

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
              color: AppColors.dotColor,
            ),
            const SizedBox(width: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: AppTextStyle.titleStyle0.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: .55.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currencyFormatter.format(product.price),
                        style: AppTextStyle.subTitleStyle2,
                      ),
                      SizedBox(
                        width: 200.w,
                        height: 50.h,
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          color: AppColors.fillColor,
                          borderRadius: BorderRadius.circular(30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  // visualDensity: VisualDensity.compact,
                                  // padding: EdgeInsets.zero,
                                  onTap: decreaseCount,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '$count',
                                    style: AppTextStyle.subTitleStyle2.copyWith(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  splashFactory: InkSparkle.splashFactory,
                                  onTap: increaseCount,
                                  child: const Icon(
                                    Icons.add,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
