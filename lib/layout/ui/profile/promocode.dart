import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromocodesPage extends StatefulWidget {
  const PromocodesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PromocodesPageState();
  }
}

class _PromocodesPageState extends State<PromocodesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppText.myPromocodes,
          style: AppTextStyle.appBarTextStyle,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.only(
              left: 200.w,
              right: 200.w,
              bottom: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    AppText.current,
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
                    AppText.used,
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
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: PromocodeCard(),
        ),
      ),
    );
  }
}

class PromocodeCard extends StatelessWidget {
  const PromocodeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 140.h,
              width: 180.w,
              color: AppColors.fillColor,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'McDuck',
                  style: AppTextStyle.titleStyle0.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '30% Off',
                  style: AppTextStyle.subTitleStyle2.copyWith(
                    fontSize: 40.sp,
                    color: AppColors.red,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Valid until June 30, 2021',
                  style: AppTextStyle.subTitleStyle2.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            IconButton(
              splashRadius: 36.0,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              alignment: Alignment.topRight,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.copy,
                size: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
