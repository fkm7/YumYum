import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/data/firebase.dart';
import 'package:delmer/model/product_category.dart';
import 'package:delmer/model/venue.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/ui/custom_components/category_radio.dart';
import 'package:delmer/ui/pages/explore/app_bar.dart';
import 'package:delmer/ui/pages/explore/explore_body.dart';
import 'package:delmer/ui/pages/explore/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Venue restaurant;

  static const route = '/explore';

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int products = 0;
  double cost = 0.0;
  ProductCategory? category = ProductCategory.fromJson({
    'id': 0,
    'is_active': true,
    'name_en': 'All',
    'name_ru': 'Все',
    'name_uz': 'Hammasi',
  });

  void categoryChanged(ProductCategory? category) {
    setState(() {
      this.category = category;
    });
  }

  @override
  Widget build(BuildContext context) => _ExplorePageView(this);
}

class _ExplorePageView extends StatefulView<ExplorePage, _ExplorePageState> {
  const _ExplorePageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: ExploreBody(widget),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            restaurant: widget.restaurant,
            forceElevated: innerBoxIsScrolled,
          ),
          StreamBuilder(
              stream: FireDatabase.getInstance().getProductCategories(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: AppColors.fillColor,
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        color: AppColors.grey,
                      ),
                    ),
                  );
                }
                final rawData = snapshot.data?.snapshot.value as List?;
                final categoriesList = <ProductCategory>[];
                rawData?.forEach((element) =>
                    categoriesList.add(ProductCategory.fromJson(element)),);
                return SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    PreferredSize(
                      preferredSize: Size.fromHeight(72.h),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CategoryRadio(
                              title: categoriesList[index].title,
                              value: categoriesList[index],
                              groupValue: state.category,
                              onChanged: (value) {
                                state.categoryChanged(value);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },),
        ],
      ),
      bottomSheet: CustomBottomSheet(
        cost: state.cost,
        productsCount: state.products,
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
          BuildContext context, double shrinkOffset, bool overlapsContent,) =>
      widget;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate != this;
}
