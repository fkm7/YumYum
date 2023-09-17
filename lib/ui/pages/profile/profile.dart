import 'package:cached_network_image/cached_network_image.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/service/auth.dart';
import 'package:delmer/service/remote_config.dart';
import 'package:delmer/ui/custom_icons/calendar_icon.dart';
import 'package:delmer/ui/custom_icons/credit_icon.dart';
import 'package:delmer/ui/custom_icons/edit_icon.dart';
import 'package:delmer/ui/custom_icons/gift_icon.dart';
import 'package:delmer/ui/custom_icons/heart_icon.dart';
import 'package:delmer/ui/custom_icons/location_icon.dart';
import 'package:delmer/ui/custom_icons/log_out_icon.dart';
import 'package:delmer/ui/pages/profile/address.dart';
import 'package:delmer/ui/pages/profile/edit_profile.dart';
import 'package:delmer/ui/pages/profile/favorites.dart';
import 'package:delmer/ui/pages/profile/order_history.dart';
import 'package:delmer/ui/pages/profile/payment_method.dart';
import 'package:delmer/ui/pages/profile/promocode.dart';
import 'package:delmer/ui/pages/auth/sign_in/sign_in.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  static const route = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final avatarUrl =
      FirebaseStorage.instance.ref('/${currentUser?.uid}/avatar');
  String? url;
  final config = FirebaseRemoteConfigService.getInstance();

  @override
  void initState() {
    super.initState();
    avatarUrl.getDownloadURL().then((value) => setState(() => url = value));
  }

  Future signOutDialog(BuildContext context) async {
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          AppText.signOutRequest,
          style: AppTextStyle.titleStyle0,
        ),
        actions: [
          CupertinoButton(
            onPressed: () => context.pop(),
            child: Text(
              AppText.no.toUpperCase(),
              style: AppTextStyle.headerStyle.copyWith(
                color: AppColors.green,
              ),
            ),
          ),
          CupertinoButton(
            onPressed: () async {
              final go = GoRouter.of(context);
              await AuthService.getInstance().signOut();
              go.pushReplacement(SignInPage.route);
            },
            child: Text(
              AppText.yes.toUpperCase(),
              style: AppTextStyle.headerStyle.copyWith(
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getAvatar() => url != null
      ? CachedNetworkImageProvider(url!)
      : const AssetImage(AppAssets.avatar);

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
                    style: AppTextStyle.headerStyle.copyWith(
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
                              CircleAvatar(
                                radius: 36.0,
                                backgroundImage: getAvatar(),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentUser?.displayName ?? '',
                                    style: AppTextStyle.titleStyle1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    currentUser?.email ?? '',
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
                          onPressed: () => context.push(EditProfilePage.route),
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
        ProfileItem(
          onTap: () => context.push(OrderHistoryPage.route),
          leading: const Icon(
            CalendarIcon.calendar,
            size: 28.0,
            color: AppColors.grey,
          ),
          title: AppText.orderHistory,
          trailing: Icons.arrow_forward_ios,
        ),
        const DottedLine(),
        ProfileItem(
          onTap: () => context.push(PaymentMethodPage.route),
          leading: const Icon(
            CreditIcon.credit_card,
            size: 22.0,
            color: AppColors.grey,
          ),
          title: AppText.paymentMethod,
          trailing: Icons.arrow_forward_ios,
        ),
        const DottedLine(),
        ProfileItem(
          onTap: () => context.push(AddressPage.route),
          leading: const Icon(
            LocationIcon.map_pin,
            size: 26.0,
            color: AppColors.grey,
          ),
          title: AppText.myAddress,
          trailing: Icons.arrow_forward_ios,
        ),
        const DottedLine(),
        Visibility(
          visible: config.showPromocodes,
          child: Column(
            children: [
              ProfileItem(
                onTap: () => context.push(PromocodesPage.route),
                leading: const Icon(
                  GiftIcon.gift,
                  size: 26.0,
                  color: AppColors.grey,
                ),
                title: AppText.myPromocodes,
                trailing: Icons.arrow_forward_ios,
              ),
              const DottedLine(),
            ],
          ),
        ),
        ProfileItem(
          onTap: () => context.push(FavoritesPage.route),
          leading: const Icon(
            HeartIcon.heart,
            size: 24.0,
            color: AppColors.grey,
          ),
          title: AppText.myFavorites,
          trailing: Icons.arrow_forward_ios,
        ),
        const DottedLine(),
        ProfileItem(
          onTap: () => signOutDialog(context),
          leading: const Icon(
            LogOutIcon.log_out,
            size: 24.0,
            color: AppColors.grey,
          ),
          title: AppText.signOut,
          trailing: null,
        ),
        const DottedLine(),
      ],
    );
  }
}

class DottedLine extends StatelessWidget {
  const DottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  final Widget leading;
  final IconData? trailing;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: trailing != null
          ? const EdgeInsets.only(left: 24.0)
          : const EdgeInsets.only(
              left: 24.0,
              right: 8.0,
            ),
      onTap: onTap,
      minLeadingWidth: 32.0,
      leading: leading,
      title: Text(
        title,
        style: AppTextStyle.subTitleStyle1.copyWith(
          color: Colors.black,
        ),
      ),
      trailing: trailing != null
          ? IconButton(
              onPressed: onTap,
              icon: Icon(
                trailing,
                color: AppColors.grey,
              ),
            )
          : null,
    );
  }
}
