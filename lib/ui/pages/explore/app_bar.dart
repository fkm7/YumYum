import 'package:delmer/model/venue.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/custom_icons/heart_icon.dart';
import 'package:delmer/ui/custom_icons/search_icon.dart';
import 'package:delmer/ui/custom_icons/truck_icon.dart';
import 'package:delmer/ui/dialogs/restaurant_info.dart';
import 'package:delmer/ui/pages/explore/custome_search_delegate.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.restaurant,
    required this.forceElevated,
  });

  final Venue restaurant;
  final bool forceElevated;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      elevation: 3.0,
      expandedHeight: 300.h,
      toolbarHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight,
      forceElevated: forceElevated,
      excludeHeaderSemantics: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
            useRootNavigator: true,
          ),
          icon: const Icon(
            SearchIcon.search,
            size: 28.0,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            HeartIcon.heart,
            size: 24.0,
            color: Colors.white,
          ),
        ),
      ],
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final top = constraints.biggest.height;
        var height = 300.h - 58.0;
        return DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.greenLight,
                AppColors.green,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              StretchMode.zoomBackground,
            ],
            centerTitle: true,
            title: top == kToolbarHeight + MediaQuery.of(context).padding.top
                ? Text(
                    restaurant.title,
                    style: AppTextStyle.appBarTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  )
                : null,
            background: Align(
              alignment: Alignment.bottomCenter,
              child: PreferredSize(
                preferredSize: Size.fromHeight(height),
                child: Container(
                  color: Colors.white,
                  height: height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 160.h,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(0.0, 3.0),
                                    blurRadius: 3.0,
                                    spreadRadius: -2.0,
                                    color: Color(0x33000000),
                                  ),
                                  BoxShadow(
                                    offset: Offset(0.0, 5.0),
                                    blurRadius: 4.0,
                                    color: Color(0x24000000),
                                  ),
                                  BoxShadow(
                                    offset: Offset(0.0, 3.0),
                                    blurRadius: 2.0,
                                    color: Color(0x1F000000),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.greenLight,
                                    AppColors.green,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Image.network(
                                        restaurant.logoUrl,
                                        height: 64.0,
                                        width: 64.0,
                                      ),
                                      const SizedBox(
                                        width: 16.0,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                          Text(
                                            restaurant.title,
                                            style: AppTextStyle.titleStyle1
                                                .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            restaurant.category.toString(),
                                            style: AppTextStyle.subTitleStyle0
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12.0,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              RestaurantInfoDialog(
                                            address:
                                                restaurant.address.street ?? '',
                                            description:
                                                restaurant.description ?? '',
                                            email: '',
                                            freeDeliveryFrom: 200,
                                            phoneNumber: restaurant.phoneNumber,
                                            title: restaurant.title,
                                            workTime:
                                                '${restaurant.startTime} ${restaurant.closingTime}',
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.info_outline,
                                        size: 32.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 1.sw,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                      horizontal: 16.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              TruckIcon.truck,
                                              size: 16.0,
                                            ),
                                            const SizedBox(
                                              width: 12.0,
                                            ),
                                            Text(
                                              '${AppText.freeDeliveryFrom} ${currencyFormatter.format(restaurant.freeDeliveryFrom)}',
                                              style:
                                                  AppTextStyle.subTitleStyle0,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellowAccent,
                                            ),
                                            Text(
                                              restaurant.rating.toString(),
                                              style:
                                                  AppTextStyle.subTitleStyle0,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },),
    );
  }
}
