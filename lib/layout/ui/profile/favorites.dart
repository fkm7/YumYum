import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.myFavorites,
          style: AppTextStyle.appBarTextStyle,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: EdgeInsets.only(
              left: 180.w,
              right: 180.w,
              bottom: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.greenLight,
                        AppColors.green,
                      ],
                    ),
                  ),
                  child: Text(
                    AppText.restaurants,
                    style: AppTextStyle.subTitleStyle0.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.greenLight,
                        AppColors.green,
                      ],
                    ),
                  ),
                  child: Text(
                    AppText.food,
                    style: AppTextStyle.subTitleStyle0.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          left: 24.0,
          top: 12.0,
          right: 24.0,
          bottom: 24.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          height: 100.0,
          color: AppColors.green,
        ),
      ),
    );
  }
}
