import 'package:delmer/core/stateless_view.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllOffersPage extends StatelessWidget {
  const AllOffersPage({Key? key}) : super(key: key);

  static const route = '/all_offers';

  @override
  Widget build(BuildContext context) => _AllOffersView(this);
}

class _AllOffersView extends StatelessView {
  const _AllOffersView(super.widget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.allOffers,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24.0),
        itemCount: 10,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              height: 250.h,
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(204, 33, 32, 50),
                    Color(0xFFEEF3FC),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Make Your First\nOrder here',
                    style: AppTextStyle.titleStyle1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    '50% Off',
                    style: AppTextStyle.subTitleStyle0.copyWith(
                      color: AppColors.yellow,
                      fontSize: 54.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Text Delivery',
                  style: AppTextStyle.subTitleStyle0.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8.0,
        ),
      ),
    );
  }
}
