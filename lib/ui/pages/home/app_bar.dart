import 'package:cached_network_image/cached_network_image.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/ui/dialogs/choose_delivery_address.dart';
import 'package:delmer/model/address.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/pages/profile/add_new_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    required this.forceElevated,
    required this.address,
  });

  final bool forceElevated;
  final String? address;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  var _address = Address(
    city: 'Samarkand',
    country: 'Uzbekistan',
    latitude: 35.0,
    longitude: 39.0,
    street: 'Sattepo',
  );

final currentUser = FirebaseAuth.instance.currentUser;
  late final avatarUrl =
      FirebaseStorage.instance.ref('/${currentUser?.uid}/avatar');
  String? url;
  getAvatar() => url != null
      ? CachedNetworkImageProvider(url!)
      : const AssetImage(AppAssets.avatar);

  @override
  void initState() {
    super.initState();
    avatarUrl.getDownloadURL().then((value) => setState(() => url = value));
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      elevation: 3.0,
      toolbarHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight + 20.0,
      forceElevated: widget.forceElevated,
      leadingWidth: 500.w,
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24.0,
          ),
          CircleAvatar(
            radius: 24.0,
            backgroundColor: Colors.white,
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
                AppText.deliverTo,
                style: AppTextStyle.titleStyle1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.address ?? '${_address.city}, ${_address.street}',
                style: AppTextStyle.subTitleStyle2.copyWith(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ChooseDeliveryAddressDialog(
                addNewAddress: () => context.push(AddNewAddress.route),
                address: _address.toString(),
                addressSelected: (value) {
                  setState(() => _address = value);
                },
                destination: 'Registon',
                  groupValue: _address,
              ),
            );
          },
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
    );
  }
}
