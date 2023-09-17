import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_icons/check_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.restaurantName,
    required this.orderTime,
    this.isDelivered = false,
    required this.cost,
    required this.onPressed,
  }) : super(key: key);

  final String restaurantName;
  final String orderTime;
  final bool isDelivered;
  final double cost;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => _OrderView(this);
}

class _OrderView extends StatelessView<OrderCard> {
  const _OrderView(super.widget);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 150.h,
        width: 1.sw,
        alignment: Alignment.center,
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Container(
                height: 150.h,
                width: 200.w,
                color: AppColors.fillColor,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.restaurantName,
                    style: AppTextStyle.titleStyle0.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.orderTime,
                    style: AppTextStyle.subTitleStyle0.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.isDelivered ? AppText.delivered : AppText.canceled,
                            style: AppTextStyle.subTitleStyle1.copyWith(
                              color: widget.isDelivered ? AppColors.green : AppColors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Icon(
                            CheckIcon.check,
                            size: 12.0,
                            color: AppColors.green,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 180.w,
                      ),
                      Text(
                        currencyFormatter.format(widget.cost),
                        style: AppTextStyle.subTitleStyle1.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
