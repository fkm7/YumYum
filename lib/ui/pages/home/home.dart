import 'package:delmer/service/remote_config.dart';
import 'package:delmer/ui/cards/venue_category_card.dart';
import 'package:delmer/ui/pages/home/view_venues.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/data/firebase.dart';
import 'package:delmer/model/category.dart';
import 'package:delmer/model/venue.dart';
import 'package:delmer/ui/cards/venue_card.dart';
import 'package:delmer/ui/pages/home/all_offers.dart';
import 'package:delmer/ui/pages/home/app_bar.dart';
import 'package:delmer/ui/pages/explore/explore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:l/l.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final config = FirebaseRemoteConfigService.getInstance();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireDatabase.getInstance().getCategories(),
      builder: (context, categoriesSnapshot) => NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          HomeAppBar(
            address: null,
            forceElevated: innerBoxIsScrolled,
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              PreferredSize(
                preferredSize: Size.fromHeight(150.h),
                child: SizedBox(
                  height: 150.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        height: 84.h,
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
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Builder(builder: (context) {
                          switch (categoriesSnapshot.connectionState) {
                            case ConnectionState.none:
                              return Center(
                                child: Text(
                                  'No internet connection',
                                  style: AppTextStyle.headerStyle,
                                ),
                              );
                            case ConnectionState.waiting:
                              return Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: AppColors.grey,
                                child: Row(
                                  children: [Container()],
                                ),
                              );
                            case ConnectionState.active:
                              if (!categoriesSnapshot.hasData) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: AppColors.grey,
                                  child: Container(
                                    color: Colors.amber,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                );
                              }
                              final data = categoriesSnapshot
                                  .data?.snapshot.value as List?;
                              final list = <Category>[];
                              data?.forEach((element) =>
                                  list.add(Category.fromJson(element)),);
                              return SizedBox(
                                height: 160.h,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CategoryComponent(
                                      title: list[index].title,
                                      asset: list[index].imageUrl,
                                      onPressed: () {
                                        context.push(
                                          ViewVenuesPage.route,
                                          extra: list[index],
                                        );
                                      },
                                    );
                                  },
                                  itemCount: list.length,
                                ),
                              );

                            case ConnectionState.done:
                              if (!categoriesSnapshot.hasData) {
                                return const Text('No Data');
                              }
                              if (categoriesSnapshot.hasError) {
                                l.e(categoriesSnapshot.error!);
                                return Text(
                                  categoriesSnapshot.error.toString(),
                                  style: AppTextStyle.headerStyle.copyWith(
                                    color: AppColors.red,
                                  ),
                                );
                              }
                              final data = (categoriesSnapshot.data) as List?;
                              final list = <Category>[];
                              data?.forEach((element) =>
                                  list.add(Category.fromJson(element)),);
                              return SizedBox(
                                height: 160.h,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CategoryComponent(
                                      title: list[index].title,
                                      asset: list[index].imageUrl,
                                      onPressed: () {
                                        context.push(
                                          ViewVenuesPage.route,
                                          extra: list[index],
                                        );
                                      },
                                    );
                                  },
                                  itemCount: list.length,
                                ),
                              );
                            default:
                              return const Text('No Data');
                          }
                        },),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Visibility(
              visible: config.showOffers,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
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
                          onTap: () => context.push(AllOffersPage.route),
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
                    itemBuilder: (context, index, realIndex) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Image.asset(
                        AppAssets.offer,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 24.0,
                bottom: 12.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                AppText.popularRestaurants,
                style: AppTextStyle.titleStyle1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: FireDatabase.getInstance().getRestaurants(),
              builder: (context, snapshot) {
                if (!categoriesSnapshot.hasData || !snapshot.hasData) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: AppColors.dotColor,
                    child: Container(
                      color: AppColors.fillColor,
                      width: 100.0,
                      height: 100.0,
                    ),
                  );
                }
                final rawCategories =
                    categoriesSnapshot.data?.snapshot.value as List?;
                final categoriesList = <Category>[];
                rawCategories?.forEach((element) =>
                    categoriesList.add(Category.fromJson(element)),);

                final rawRestaurants = (snapshot.data)?.snapshot.value as List?;
                return ListView.builder(
                  itemCount: rawRestaurants?.length ?? 0,
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemBuilder: (context, index) {
                    final category = categoriesList.firstWhere((element) =>
                        element.id ==
                        ((rawRestaurants?[index] as Map?)?['category'] ?? 0),);
                    final venue = Venue.fromJson(rawRestaurants?[index]);
                    return VenueCard(
                      venue: venue,
                      onPressed: () {
                        if (rawRestaurants != null &&
                            rawRestaurants[index] != null) {
                          context.push(ExplorePage.route, extra: venue);
                        }
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.widget);

  final PreferredSize widget;

  @override
  double get minExtent => widget.preferredSize.height;
  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent,) {
    return Container(
      child: widget,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate != this;
}
