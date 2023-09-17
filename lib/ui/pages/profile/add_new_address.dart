import 'package:delmer/ui/cards/add_new_address_card.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({
    Key? key,
  }) : super(key: key);

  static const route = '/add_new_address';

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
Position? position;
  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    Geolocator.getCurrentPosition()
        .then((value) => setState(() => position = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    center: position != null
                        ? LatLng(position!.latitude, position!.longitude)
                        : LatLng(51.509364, -0.128928),
                    zoom: 9.2,
                    maxZoom: 18.4,
                  ),
                  nonRotatedChildren: [
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () =>
                              launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
                const Center(
                  child: Icon(
                    Icons.location_on,
                    size: 42.0,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          ),
          const AddNewAddressCard(),
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
          top: 12.0,
          bottom: 24.0,
        ),
        child: ElevatedButton(
          // height: AppDimens.kButtonHeight,
          // minWidth: double.infinity,
          // padding: EdgeInsets.zero,
          // shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.all(Radius.circular(40)),
          // ),
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            fixedSize: const Size(double.infinity, AppDimens.kButtonHeight),
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
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
                child: Center(
                  child: Text(
                    AppText.save.toUpperCase(),
                    style: AppTextStyle.buttonStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 0,
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
