import 'package:delmer/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 48.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images/bag.svg',
            height: 500.h,
            width: 1.sw,
          ),
          Text(
            'Your Cart Is Empty!',
            style: AppTextStyle.titleStyle0.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 32.0,
            ),
            child: Text(
              'Qui ex aute ipsum duis. Incididunt adipisicing voluptate laborum',
              style: AppTextStyle.subTitleStyle2,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          SvgPicture.asset(
            'assets/images/waves.svg',
            height: 48.h,
            width: 1.sw,
          ),
        ],
      ),
    );
  }
}
