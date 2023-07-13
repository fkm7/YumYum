import 'package:delmer/layout/custom_icons/location_icon.dart';
import 'package:delmer/layout/ui/order/cart.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/product_card.dart';
import 'package:delmer/layout/custom_icons/heart_icon.dart';
import 'package:delmer/layout/custom_icons/search_icon.dart';
import 'package:delmer/layout/custom_icons/truck_icon.dart';
import 'package:delmer/layout/ui/restaurant/detail.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              SearchIcon.search,
              color: Colors.white,
              size: 28.0,
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
        flexibleSpace: Container(
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
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(140.0),
          child: Container(
            height: 140.0,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 120.0,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppAssets.dumpling,
                            height: 64.0,
                            width: 64.0,
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                'UA Taste',
                                style: AppTextStyle.titleStyle1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Ukrainian cuisine',
                                style: AppTextStyle.subTitleStyle0.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 600.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 8.0,
                                        top: 32.0,
                                        bottom: 8.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'UA Taste',
                                            style: AppTextStyle.titleStyle0.copyWith(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        right: 24.0,
                                        top: 8.0,
                                        bottom: 16.0,
                                      ),
                                      child: Text(
                                        AppText.ipsum,
                                        style: AppTextStyle.subTitleStyle1.copyWith(
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        top: 16.0,
                                        bottom: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            size: 16.0,
                                          ),
                                          const SizedBox(
                                            width: 4.0,
                                          ),
                                          Text(
                                            '+1 387 456 88 74',
                                            style: AppTextStyle.subTitleStyle0.copyWith(
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        top: 8.0,
                                        bottom: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            LocationIcon.map_pin,
                                            size: 16.0,
                                          ),
                                          const SizedBox(
                                            width: 4.0,
                                          ),
                                          Text(
                                            '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                                            style: AppTextStyle.subTitleStyle0.copyWith(
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        top: 8.0,
                                        bottom: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.mail,
                                            size: 16.0,
                                          ),
                                          const SizedBox(
                                            width: 4.0,
                                          ),
                                          Text(
                                            'uataste@mail.com',
                                            style: AppTextStyle.subTitleStyle0.copyWith(
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        top: 8.0,
                                        bottom: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.timer,
                                            size: 16.0,
                                          ),
                                          const SizedBox(
                                            width: 4.0,
                                          ),
                                          Text(
                                            '10 AM - 11 PM, 7 days/week',
                                            style: AppTextStyle.subTitleStyle0.copyWith(
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 24.0,
                                        top: 8.0,
                                        bottom: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            TruckIcon.truck,
                                            size: 16.0,
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text: 'Free delivery from ',
                                              children: [
                                                TextSpan(
                                                  text: '\$200 in order',
                                                  style: AppTextStyle.subTitleStyle0
                                                      .copyWith(
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            style: AppTextStyle.subTitleStyle0.copyWith(
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  'Free delivery from \$200',
                                  style: AppTextStyle.subTitleStyle0,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  '5.0',
                                  style: AppTextStyle.subTitleStyle0,
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
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                height: 25.0,
                width: 100.0,
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
          const SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 100.0,
              ),
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                mainAxisExtent: 300.h,
                childAspectRatio: 1.0,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCard(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const DetailPage();
                    }));
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppColors.fillColor,
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 12.0,
          bottom: 24.0,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const CartPage()));
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            fixedSize: const Size(double.infinity, AppDimens.kButtonHeight),
            alignment: Alignment.center,
          ),
          child: Ink(
            height: AppDimens.kButtonHeight,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$73.4',
                  style: AppTextStyle.subTitleStyle2.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  AppText.viewCart,
                  style: AppTextStyle.subTitleStyle1.copyWith(
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3',
                    style: AppTextStyle.subTitleStyle1.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
