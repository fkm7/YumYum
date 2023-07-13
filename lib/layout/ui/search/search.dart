import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components//restaurant_card.dart';
import 'package:delmer/layout/custom_icons//filter_icon.dart';
import 'package:delmer/layout/ui/search/filter.dart';
import 'package:delmer/layout/ui/restaurant/view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 42.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 24.0,
                ),
                hintText: AppText.searchFor,
                suffixIcon: IconButton(
                  icon: const Icon(
                    FilterIcon.filter,
                    size: 18.0,
                  ),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const FilterPage())),
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
          SizedBox(
            height: 40.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 24.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.zero,
                    fixedSize: const Size(100.0, 35.0),
                  ),
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.greenLight,
                          AppColors.green,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppText.all,
                      style: AppTextStyle.subTitleStyle0.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 28.0,
              top: 24.0,
              bottom: 12.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              AppText.popularRestaurants,
              style: AppTextStyle.titleStyle2.copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            primary: false,
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (context, index) => RestaurantCard(
              restaurantTitle: 'Desert cafe',
              restaurantCategory: 'Pizza',
              rating: 4.5,
              distance: 500.0,
              deliveryCost: 15000.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const ViewPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
