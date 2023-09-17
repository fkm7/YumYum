import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_components/cuisine_radio.dart';
import 'package:delmer/ui/custom_components/sort_by_radio.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';

enum SortBy { lowToHigh, highToLow, topRated, nearestToMe, mostPopular }

enum CuisineChoices {
  ukrainian,
  chinese,
  japanese,
  italian,
  georgian,
  american,
  asian,
  thai
}

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({Key? key}) : super(key: key);

  static const route = '/filter';

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  CuisineChoices? choices;
  SortBy? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppText.filter,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppText.sortBy,
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SortByRadio(
            title: AppText.priceLowToHigh,
            value: SortBy.lowToHigh,
            groupValue: category,
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          SortByRadio(
            title: AppText.priceHighToLow,
            value: SortBy.highToLow,
            groupValue: category,
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          SortByRadio(
            title: AppText.topRated,
            value: SortBy.topRated,
            groupValue: category,
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          SortByRadio(
            title: AppText.nearestToMe,
            value: SortBy.nearestToMe,
            groupValue: category,
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          SortByRadio(
            title: AppText.mostPopular,
            value: SortBy.mostPopular,
            groupValue: category,
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppText.cuisines,
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4.0,
              ),
              children: [
                CuisineRadio(
                  cusineName: AppText.ukrainian,
                  value: CuisineChoices.ukrainian,
                  groupValue: choices,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.chinese,
                  value: CuisineChoices.chinese,
                  groupValue: choices,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.italian,
                  groupValue: choices,
                  value: CuisineChoices.italian,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.thai,
                  groupValue: choices,
                  value: CuisineChoices.thai,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.georgian,
                  groupValue: choices,
                  value: CuisineChoices.georgian,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.asian,
                  groupValue: choices,
                  value: CuisineChoices.asian,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.american,
                  groupValue: choices,
                  value: CuisineChoices.american,
                  onChanged: (CuisineChoices? value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
                CuisineRadio(
                  cusineName: AppText.japanese,
                  groupValue: choices,
                  value: CuisineChoices.japanese,
                  onChanged: (value) {
                    setState(() {
                      choices = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 24.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              alignment: Alignment.bottomCenter,
              child: GradientButton(
                height: AppDimens.kButtonHeight,
                width: double.infinity,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppText.apply.toUpperCase(),
                  style: AppTextStyle.buttonStyle,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
