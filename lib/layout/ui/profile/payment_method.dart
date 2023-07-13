import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:delmer/layout/ui/profile/edit_card.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/credit_card.dart';
import 'package:delmer/layout/custom_icons/edit_icon.dart';
import 'package:delmer/layout/ui/profile/add_new_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.paymentMethod,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.creditCards,
                  style: AppTextStyle.subTitleStyle2.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const AddNewCardPage()));
                  },
                  child: Text(
                    AppText.add,
                    style: AppTextStyle.subTitleStyle2,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
              height: 320.h,
              padEnds: true,
              enlargeFactor: 0.3,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              aspectRatio: 16.0 / 9.0,
              viewportFraction: 0.8,
            ),
            itemBuilder: (context, index, realIndex) => CreditCard(
              cardNumber: '1234 1234 1234 1234',
              expiryDate: '04/24',
              ownerName: 'Elsa\nSteve',
              color: creditCardColors[
                  Random(DateTime.now().second).nextInt(creditCardColors.length)],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EditCard();
              }));
            },
            child: Container(
              height: 180.h,
              padding: const EdgeInsets.all(24.0),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: AspectRatio(
                aspectRatio: 4.0 / 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.edit,
                      style: AppTextStyle.titleStyle0.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      EditIcon.edit,
                      size: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
