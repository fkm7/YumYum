import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/ui/custom_icons/location_icon.dart';
import 'package:delmer/ui/custom_icons/truck_icon.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RestaurantInfoDialog extends StatelessWidget {
  const RestaurantInfoDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.phoneNumber,
    required this.address,
    required this.email,
    required this.workTime,
    required this.freeDeliveryFrom,
  }) : super(key: key);

  final String title;
  final String description;
  final String email;
  final String address;
  final String phoneNumber;
  final String workTime;
  final double freeDeliveryFrom;

  @override
  Widget build(BuildContext context) {
    return _RestaurantInfoDialogView(this);
  }
}

class _RestaurantInfoDialogView extends StatelessView<RestaurantInfoDialog> {
  const _RestaurantInfoDialogView(super.widget);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 8.0,
              top: 16.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyle.titleStyle0.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 8.0,
              bottom: 16.0,
            ),
            child: Text(
              widget.description,
              style: AppTextStyle.subTitleStyle1.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 16.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  widget.phoneNumber,
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                const Icon(
                  LocationIcon.map_pin,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  widget.address,
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.mail,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  widget.email,
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.timer,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  widget.workTime,
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              children: [
                const Icon(
                  TruckIcon.truck,
                  size: 16.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text.rich(
                  TextSpan(
                    text: '${AppText.freeDeliveryFrom} ',
                    children: [
                      TextSpan(
                        text:
                            '${currencyFormatter.format(widget.freeDeliveryFrom)} in order',
                        style: AppTextStyle.subTitleStyle0.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
