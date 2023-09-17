import 'package:delmer/model/venue.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_icons/location_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VenueCard extends StatelessWidget {
  const VenueCard({
    super.key,
    required this.venue,
    required this.onPressed,
  });

  final Venue venue;
  final VoidCallback onPressed;

  double getDistance() {
    return 500.0;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<VoidCallback>('onPressed', onPressed));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 3.0,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: AppColors.fillColor,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        venue.imageUrl,
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Colors.yellowAccent,
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        venue.rating.toString(),
                        style: AppTextStyle.subTitleStyle0.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  venue.title,
                  style: AppTextStyle.titleStyle0.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  venue.category.toString(),
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LocationIcon.map_pin,
                          size: 16.0,
                          color: AppColors.grey,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '${getDistance()} km',
                          style: AppTextStyle.subTitleStyle0.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 24.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                          size: 16.0,
                          color: AppColors.grey,
                        ),
                        Text(
                          AppText.free,
                          style: AppTextStyle.subTitleStyle0.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
