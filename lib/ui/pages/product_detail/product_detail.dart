import 'package:cached_network_image/cached_network_image.dart';
import 'package:delmer/model/product.dart';
import 'package:delmer/ui/pages/cart/cart.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  static const route = '/detail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _pageController = PageController();
  final int _numPages = 5;
  int _currentPage = 0;
  int products = 0;
  double cost = 0.0;

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _numPages; i++) {
      indicators.add(_indicator(i == _currentPage));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
              Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.75,
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
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            widget.product.imageUrl,
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
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
                    ),
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
              widget.product.title,
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
              widget.product.description,
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
                      currencyFormatter.format(widget.product.price),
                      style: AppTextStyle.subTitleStyle2.copyWith(
                        fontSize: 20.0,
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      '350 gr',
                      style: AppTextStyle.subTitleStyle0.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: 240.w,
                  height: 64.h,
                  padding: EdgeInsets.zero,
                  // padding: const EdgeInsets.symmetric(
                  //   vertical: 4.0,
                  //   horizontal: 12.0,
                  // ),
                  decoration: BoxDecoration(
                    color: AppColors.fillColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.remove,
                              size: 42.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '1',
                              style: AppTextStyle.subTitleStyle2.copyWith(
                                fontSize: 38.sp,
                                color: AppColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add,
                              size: 42.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: AppColors.fillColor,
          border: Border(
            top: BorderSide(
              color: AppColors.dotColor,
              width: 2.0,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 16.0,
          bottom: 32.0,
        ),
        child: ElevatedButton(
          onPressed: () {
            context.push(CartPage.route, extra: {'canPop': true});
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            fixedSize: const Size(double.infinity, 56.0),
            alignment: Alignment.center,
          ),
          child: Stack(
            children: [
              Ink(
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
                      currencyFormatter.format(cost),
                      style: AppTextStyle.subTitleStyle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      AppText.add2Cart.toUpperCase(),
                      style: AppTextStyle.buttonStyle,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$products',
                        style: AppTextStyle.subTitleStyle1.copyWith(
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16.0,
                bottom: 0.0,
                child: SvgPicture.asset(
                  AppAssets.wave,
                  fit: BoxFit.cover,
                  height: 48.0,
                  width: 48.0,
                  allowDrawingOutsideViewBox: false,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
