import 'package:carousel_slider/carousel_slider.dart';
import 'package:delmer/layout/ui/order/cart.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _pageController = PageController();
  final int _numPages = 5;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 16.0,
        width: 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : AppColors.dotColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.65.sh,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.yellow,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.orange,
                    ),
                    Container(
                      color: Colors.amberAccent,
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 24.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              bottom: 6.0,
            ),
            child: Text(
              'Dumplings with Cherries',
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 6.0,
            ),
            child: Text(
              AppText.lorem,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '\$9.95',
                      style: AppTextStyle.subTitleStyle2.copyWith(
                        fontSize: 20.0,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      '350 gr',
                      style: AppTextStyle.subTitleStyle0.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.fillColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          size: 32.0,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        '1',
                        style: AppTextStyle.subTitleStyle2.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppColors.fillColor,
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 16.0,
          bottom: 32.0,
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
            fixedSize: const Size(double.infinity, 56.0),
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
                  AppText.add2Cart.toUpperCase(),
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
