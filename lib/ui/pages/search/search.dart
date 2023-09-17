import 'package:delmer/model/product.dart';
import 'package:delmer/model/product_category.dart';
import 'package:delmer/ui/cards/search_product_card.dart';
import 'package:delmer/ui/pages/product_detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:delmer/data/firebase.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/ui/custom_components/category_radio.dart';
import 'package:delmer/ui/custom_icons/filter_icon.dart';
import 'package:delmer/ui/pages/search/search_filter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const route = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProductCategory? category = ProductCategory.fromJson({
    'id': 0,
    'is_active': true,
    'name_en': 'All',
    'name_ru': 'Все',
    'name_uz': 'Hammasi',
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FireDatabase.getInstance().getProductCategories(),
        builder: (context, categoriesSnapshot) {
          final data = categoriesSnapshot.hasData
              ? (categoriesSnapshot.data)?.snapshot.value as List?
              : null;
          final categories = <ProductCategory>[];
          data?.forEach(
              (element) => categories.add(ProductCategory.fromJson(element)),);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                leading: null,
                elevation: .1,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 24.0,
                      ),
                      hintText: AppText.searchFor,
                      suffixIcon: IconButton(
                        onPressed: () => context.push(SearchFilterPage.route),
                        icon: const Icon(
                          FilterIcon.filter,
                          size: 18.0,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.fillColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    height: 40.0,
                    child: categoriesSnapshot.hasData
                        ? ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: CategoryRadio(
                                title: categories[index].title,
                                value: categories[index],
                                groupValue: category,
                                onChanged: (value) {
                                  setState(() => category = value);
                                },
                              ),
                            ),
                          )
                        : const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     padding: const EdgeInsets.only(
              //       left: 28.0,
              //       top: 24.0,
              //       bottom: 12.0,
              //     ),
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       AppText.popularRestaurants,
              //       style: AppTextStyle.titleStyle2.copyWith(
              //         color: Colors.black,
              //       ),
              //       textAlign: TextAlign.left,
              //     ),
              //   ),
              // ),
              StreamBuilder(
                  stream: FireDatabase.getInstance().getProducts(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),);
                    }
                    final data = (snapshot.data)?.snapshot.value as List?;
                      return SliverPadding(
                      padding: const EdgeInsets.all(24.0),
                        sliver: SliverList.builder(
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                          final category = categories.firstWhere((element) =>
                                element.id == ((data?[index] as Map?)?['category'] ?? 0),);
                          final product = Product.fromJson(data?[index]);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: SearchProductCard(
                              product: product,
                              onPressed: () {
                                context.push(
                                  ProductDetailPage.route,
                                  extra: product,
                                );
                              },
                            ),
                          );
                        },
                        ),
                      );
                    
                  },),
            ],
          );
        },);
  }
}

