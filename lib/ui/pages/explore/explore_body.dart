import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/data/firebase.dart';
import 'package:delmer/model/product.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/cards/venue_product_card.dart';
import 'package:delmer/ui/pages/product_detail/product_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreBody extends StatelessView {
  const ExploreBody(
    super.widget, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FireDatabase.getInstance().getProducts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text(
                  AppText.noConnection,
                  style: AppTextStyle.headerLargeStyle,
                ),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ConnectionState.active:
              if (snapshot.hasData) {
                final data = snapshot.data?.snapshot.value as List?;
                final productList = <Product>[];
                data?.forEach(
                    (element) => productList.add(Product.fromJson(element)),);
                return GridView.builder(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 12.0,
                    right: 24.0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    mainAxisExtent: 320.h,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) => VenueProductCard(
                    product: productList[index],
                    onPressed: () => context.push(
                      ProductDetailPage.route,
                      extra: productList[index],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                final data = snapshot.data?.snapshot.value as List?;
                final productList = <Product>[];
                data?.forEach(
                    (element) => productList.add(Product.fromJson(element)),);
                return GridView.builder(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 12.0,
                    right: 24.0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    mainAxisExtent: 320.h,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (context, index) => VenueProductCard(
                    product: productList[index],
                    onPressed: () => context.push(
                      ProductDetailPage.route,
                      extra: productList[index],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            default:
              return Center(
                child: Text(
                  AppText.noData,
                  style: AppTextStyle.headerLargeStyle,
                ),
              );
          }
        },);
  }
}
