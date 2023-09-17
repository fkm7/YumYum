import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VenueProductCard extends StatelessWidget {
  const VenueProductCard({
    Key? key,
    required this.foodName,
    required this.count,
    required this.price,
    required this.decreaseCount,
    required this.increaseCount,
  }) : super(key: key);

  final String foodName;
  final int count;
  final double price;
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
                  foodName,
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
                        currencyFormatter.format(price),
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
