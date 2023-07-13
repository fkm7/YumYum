import 'package:delmer/res/text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_icons/calendar_icon.dart';
import 'package:delmer/layout/custom_icons/credit_icon.dart';
import 'package:delmer/layout/custom_icons/edit_icon.dart';
import 'package:delmer/layout/custom_icons/gift_icon.dart';
import 'package:delmer/layout/custom_icons/heart_icon.dart';
import 'package:delmer/layout/custom_icons/location_icon.dart';
import 'package:delmer/layout/custom_icons/log_out_icon.dart';
import 'package:delmer/layout/ui/profile/address.dart';
import 'package:delmer/layout/ui/profile/edit_profile.dart';
import 'package:delmer/layout/ui/profile/favorites.dart';
import 'package:delmer/layout/ui/profile/order_history.dart';
import 'package:delmer/layout/ui/profile/payment_method.dart';
import 'package:delmer/layout/ui/profile/promocode.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(
          height: 420.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 350.h,
                width: mediaQuery.size.width,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[6],
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.greenLight,
                      AppColors.green,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                  ),
                  child: Text(
                    AppText.myProfile,
                    style: AppTextStyle.titleStyle1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: kElevationToShadow[12],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 36.0,
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Leslie Alexander',
                                    style: AppTextStyle.titleStyle1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'lesliealexander@mail.ru',
                                    style: AppTextStyle.subTitleStyle1.copyWith(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 48.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, EditProfilePage.route),
                          icon: const Icon(
                            EditIcon.edit,
                            size: 16.0,
                            color: AppColors.grey,
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
        const SizedBox(
          height: 24.0,
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24.0,
            right: 8.0,
          ),
          onTap: () => Navigator.pushNamed(
            context,
            OrderHistoryPage.route,
          ),
          minLeadingWidth: 32.0,
          leading: const Icon(
            CalendarIcon.calendar,
            size: 26.0,
            color: AppColors.grey,
          ),
          title: Text(
            AppText.orderHistory,
            style: AppTextStyle.subTitleStyle1.copyWith(
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onPressed: () => Navigator.pushNamed(
              context,
              OrderHistoryPage.route,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 72.0,
            right: 36.0,
          ),
          child: DecoratedBox(
            decoration: DottedDecoration(
              linePosition: LinePosition.bottom,
              color: AppColors.dotColor,
              shape: Shape.line,
              strokeWidth: 2.0,
              dash: const [2, 5],
            ),
            child: SizedBox(
              width: 1.sw,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24.0,
            right: 8.0,
          ),
          minLeadingWidth: 32.0,
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const PaymentMethodPage())),
          leading: const Icon(
            CreditIcon.credit_card,
            size: 20.0,
            color: AppColors.grey,
          ),
          title: Text(
            AppText.paymentMethod,
            style: AppTextStyle.subTitleStyle1.copyWith(
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const PaymentMethodPage())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 72.0,
            right: 36.0,
          ),
          child: DecoratedBox(
            decoration: DottedDecoration(
              linePosition: LinePosition.bottom,
              color: AppColors.dotColor,
              shape: Shape.line,
              strokeWidth: 2.0,
              dash: const [2, 5],
            ),
            child: SizedBox(
              width: 1.sw,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24.0,
            right: 8.0,
          ),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddressPage())),
          minLeadingWidth: 32.0,
          leading: const Icon(
            LocationIcon.map_pin,
            size: 24.0,
            color: AppColors.grey,
          ),
          title: Text(
            AppText.myAddress,
            style: AppTextStyle.subTitleStyle1.copyWith(
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AddressPage())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 72.0,
            right: 36.0,
          ),
          child: DecoratedBox(
            decoration: DottedDecoration(
              linePosition: LinePosition.bottom,
              color: AppColors.dotColor,
              shape: Shape.line,
              strokeWidth: 2.0,
              dash: const [2, 5],
            ),
            child: SizedBox(
              width: 1.sw,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24.0,
            right: 8.0,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const PromocodesPage()));
          },
          minLeadingWidth: 32.0,
          leading: const Icon(
            GiftIcon.gift,
            size: 24.0,
            color: AppColors.grey,
          ),
          title: Text(
            AppText.myPromocodes,
            style: AppTextStyle.subTitleStyle1.copyWith(
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const PromocodesPage()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 72.0,
            right: 36.0,
          ),
          child: DecoratedBox(
            decoration: DottedDecoration(
              linePosition: LinePosition.bottom,
              color: AppColors.dotColor,
              shape: Shape.line,
              strokeWidth: 2.0,
              dash: const [2, 5],
            ),
            child: SizedBox(
              width: 1.sw,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24.0,
            right: 8.0,
          ),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const FavoritesPage())),
          minLeadingWidth: 32.0,
          leading: const Icon(
            HeartIcon.heart,
            size: 24.0,
            color: AppColors.grey,
          ),
          title: Text(
            AppText.myFavorites,
            style: AppTextStyle.subTitleStyle1.copyWith(
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const FavoritesPage()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 72.0,
            right: 36.0,
          ),
          child: DecoratedBox(
            decoration: DottedDecoration(
              linePosition: LinePosition.bottom,
              color: AppColors.dotColor,
              shape: Shape.line,
              strokeWidth: 2.0,
              dash: const [2, 5],
            ),
            child: SizedBox(
              width: 1.sw,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
            left: 24.0,
          ),
          onTap: () {},
          minLeadingWidth: 32.0,
          leading: const Icon(
            LogOutIcon.log_out,
            size: 24.0,
            color: AppColors.grey,
          ),
          title: Text(
            AppText.signOut,
            style: AppTextStyle.subTitleStyle1.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 72.0,
            right: 36.0,
          ),
          child: DecoratedBox(
            decoration: DottedDecoration(
              linePosition: LinePosition.bottom,
              color: AppColors.dotColor,
              shape: Shape.line,
              strokeWidth: 2.0,
              dash: const [
                2,
                5,
              ],
            ),
            child: SizedBox(
              width: 1.sw,
            ),
          ),
        ),
      ],
    );
  }
}
