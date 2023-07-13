import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/cuisine_choice.dart';
import 'package:delmer/layout/custom_components/filter_checkbox.dart';
import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

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
          onPressed: () => Navigator.pop(context),
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
          FilterCategoryCheckBox(
            title: 'Price low to high',
            selected: (bool value) {},
          ),
          FilterCategoryCheckBox(
            title: 'Price high to low',
            selected: (bool value) {},
          ),
          FilterCategoryCheckBox(
            title: 'Top rated',
            selected: (bool value) {},
          ),
          FilterCategoryCheckBox(
            title: 'Nearest to me',
            selected: (bool value) {},
          ),
          FilterCategoryCheckBox(
            title: 'Most popular',
            selected: (bool value) {},
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Cuisines',
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
                CuisineChoice(
                  cusineName: 'Ukrainian',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'Chinese',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'Italian',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'Thai',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'Georgian',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'Asian',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'American',
                  onSelected: (bool value) {},
                ),
                CuisineChoice(
                  cusineName: 'Japanese',
                  onSelected: (bool value) {},
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
