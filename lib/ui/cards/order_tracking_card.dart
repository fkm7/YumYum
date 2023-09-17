import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/ui/custom_components/custom_stepper.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTrackingCard extends StatelessWidget {
  const OrderTrackingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OrderTrackingView(this);
  }
}

class _OrderTrackingView extends StatelessView<OrderTrackingCard> {
  const _OrderTrackingView(super.widget);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Text(
              AppText.orderTracking,
              style: AppTextStyle.titleStyle2,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Row(
              children: [
                Container(
                  height: 64.0,
                  width: 64.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.fillColor,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Floyd Miles',
                      style: AppTextStyle.titleStyle1,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Courier',
                      style: AppTextStyle.subTitleStyle0.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    width: 64.0,
                    height: 64.0,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      left: 4.0,
                      bottom: 4.0,
                      top: 2.0,
                      right: 2.0,
                    ),
                    decoration: DottedDecoration(
                      shape: Shape.circle,
                      dash: const [4, 5],
                      strokeWidth: 2.2,
                      color: AppColors.green,
                    ),
                    child: Ink(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[6],
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.greenLight,
                            AppColors.green,
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.phone_outlined,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              right: 24.0,
            ),
            width: 1.sw,
            decoration: DottedDecoration(
              strokeWidth: 2.0,
              dash: const [2, 5],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            child: CustomStepper(
              margin: EdgeInsets.zero,
              currentStep: 1,
              controlsBuilder: (context, details) => const SizedBox.shrink(),
              steps: [
                Step(
                  isActive: true,
                  title: Text(
                    'Desert Show Cafe',
                    style: AppTextStyle.titleStyle1,
                  ),
                  content: const SizedBox.shrink(),
                  subtitle: Text(
                    '8101 S Kenneth Ave, Chicago, IL 60652, USA',
                    style: AppTextStyle.subTitleStyle0,
                  ),
                ),
                Step(
                  title: Text(
                    'Courier',
                    style: AppTextStyle.titleStyle1,
                  ),
                  content: const SizedBox.shrink(),
                  subtitle: Text(
                    'Delivering',
                    style: AppTextStyle.subTitleStyle0,
                  ),
                ),
                Step(
                  title: Text(
                    'Home',
                    style: AppTextStyle.titleStyle1,
                  ),
                  subtitle: Text(
                    '8000 S Kirkland Ave, Chicago, IL 60652, USA',
                    style: AppTextStyle.subTitleStyle0,
                  ),
                  content: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
