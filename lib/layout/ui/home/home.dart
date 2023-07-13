import 'package:carousel_slider/carousel_slider.dart';
import 'package:delmer/layout/ui/restaurant/view.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/food_category_card.dart';
import 'package:delmer/layout/custom_components/restaurant_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 400.h,
            child: Stack(
              children: [
                Container(
                  height: 300.h,
                  width: mediaQuery.size.width,
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75),
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
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 24.0),
                          const CircleAvatar(
                            radius: 24.0,
                            backgroundColor: Colors.white,
                          ),
                          const SizedBox(width: 12.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deliver To:',
                                style: AppTextStyle.titleStyle1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Samarkand, Samarkand',
                                style: AppTextStyle.subTitleStyle2.copyWith(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(Size(1.sw, 180.h)),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: 35,
                      itemBuilder: (context, index) {
                        return FoodCategoryCard(
                          asset: AppAssets.burger,
                          title: 'Burger',
                          onPressed: () {},
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.hotOffers,
                  style: AppTextStyle.titleStyle1.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        AppText.all,
                        style: AppTextStyle.subTitleStyle2.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.grey,
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
              autoPlay: true,
              padEnds: true,
              height: 300.h,
              aspectRatio: 16.0 / 9.0,
              viewportFraction: 0.85,
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            itemBuilder: (context, index, realIndex) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset(
                  AppAssets.offer,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 24.0, top: 24.0, bottom: 12.0),
            alignment: Alignment.centerLeft,
            child: Text(
              AppText.popularRestaurants,
              style: AppTextStyle.titleStyle1.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            itemCount: 30,
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            itemBuilder: (context, index) {
              return RestaurantCard(
                restaurantTitle: 'Desert show Cafe',
                restaurantCategory: 'Bakery',
                deliveryCost: 0,
                rating: 5.0,
                distance: 500.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ViewPage();
                  }));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
