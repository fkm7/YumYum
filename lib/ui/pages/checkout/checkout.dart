import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/model/address.dart';
import 'package:delmer/model/order.dart';
import 'package:delmer/model/payment.dart';
import 'package:delmer/ui/custom_icons/location_icon.dart';
import 'package:delmer/ui/dialogs/choose_delivery_address.dart';
import 'package:delmer/ui/dialogs/choose_payment_method.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/pages/checkout/order_status.dart';
import 'package:delmer/util/formatters.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  static const route = '/checkout';

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Order? order;
  Payment? paymentDetail;
  String comment = '';
  final _address = Address(
    city: '',
    country: '',
    latitude: 36.0,
    longitude: 39.0,
    street: '',
  );

  void sendOrder() {
    context.push(OrderStatusPage.route);
  }

  void onCommentChanged(String value) => comment = value;

  @override
  Widget build(BuildContext context) => _CheckoutPageView(this);
}

class _CheckoutPageView extends StatefulView<CheckoutPage, _CheckoutPageState> {
  const _CheckoutPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppText.checkout,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            leading: SvgPicture.asset(
              AppAssets.clipboard,
              height: 24.0,
              width: 24.0,
            ),
            title: Text(
              AppText.myOrder,
              style: AppTextStyle.titleStyle0,
            ),
            subtitle: Row(
              children: [
                const Icon(
                  LocationIcon.map_pin,
                  size: 12.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  state.order?.restaurantName ?? '',
                  style: AppTextStyle.subTitleStyle0,
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  currencyFormatter.format(state.order?.cost ?? 0),
                  style: AppTextStyle.subTitleStyle1.copyWith(
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: DottedDecoration(
              dash: const [2, 5],
              strokeWidth: 2.0,
            ),
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ChooseDeliveryAddressDialog(
                  addNewAddress: () {},
                  address: '',
                  addressSelected: (value) {},
                  destination: '',
                  groupValue: state._address,
                ),
              );
            },
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            leading: const Icon(
              LocationIcon.map_pin,
            ),
            title: Text(
              AppText.deliveryAddress,
              style: AppTextStyle.titleStyle0,
            ),
            subtitle: Text(
              state.order?.deliveryAddress ?? '',
              style: AppTextStyle.subTitleStyle0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: DottedDecoration(
              dash: const [2, 5],
              strokeWidth: 2.0,
            ),
          ),
          ListTile(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => const ChoosePaymentMethodDialog(
                paymentDetails: [],
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            leading: SvgPicture.asset(
              AppAssets.creditCard,
              height: 24.0,
              width: 24.0,
            ),
            title: Text(
              AppText.paymentMethod,
              style: AppTextStyle.titleStyle0,
            ),
            subtitle: Text(
              '4140 ******** 5434',
              style: AppTextStyle.subTitleStyle0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            decoration: DottedDecoration(
              dash: const [2, 5],
              strokeWidth: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              onChanged: state.onCommentChanged,
              textInputAction: TextInputAction.done,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: AppText.comment.toUpperCase(),
                labelStyle: AppTextStyle.subTitleStyle1,
              ),
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
          top: 12.0,
          bottom: 32.0,
        ),
        child: ElevatedButton(
          onPressed: state.sendOrder,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            fixedSize: const Size(double.infinity, AppDimens.kButtonHeight),
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
                child: Center(
                  child: Text(
                    AppText.sendOrder.toUpperCase(),
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
