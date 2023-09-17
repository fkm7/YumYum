import 'package:cached_network_image/cached_network_image.dart';
import 'package:delmer/model/venue.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_icons/location_icon.dart';
import 'package:delmer/util/formatters.dart';
import 'package:delmer/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteVenueCard extends StatelessWidget {
  const FavoriteVenueCard({
    super.key,
    required this.venue,
    required this.onTap,
  });

  final Venue venue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: 180.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: AppColors.green,
              image: DecorationImage(
                image: CachedNetworkImageProvider(venue.imageUrl),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
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
                height: 8.0,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16.0,
                        color: AppColors.yellow,
                      ),
                      Text(
                        venue.rating.toString(),
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
                        LocationIcon.map_pin,
                        size: 12.0,
                        color: AppColors.grey,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '${calculateDistance()} km - ${currencyFormatter.format(venue.deliveryCost)}',
                        style: AppTextStyle.subTitleStyle0.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
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
    );
  }
}
