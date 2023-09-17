import 'package:delmer/ui/custom_components/address_radio_tile.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseDeliveryAddressDialog extends StatelessWidget {
  const ChooseDeliveryAddressDialog({
    Key? key,
    required this.address,
    required this.destination,
    required this.addNewAddress,
    required this.groupValue,
    required this.addressSelected,
  }) : super(key: key);

  final String address;
  final String destination;
  final Object groupValue;
  final VoidCallback addNewAddress;
  final ValueChanged addressSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .6.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
              bottom: 12.0,
            ),
            child: Text(
              AppText.chooseDeliveryAddress,
              style: AppTextStyle.titleStyle2.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Column(
                children: [
                  AddressListRadioTile(
                    address: address,
                    destination: destination,
                    groupValue: groupValue,
                    value: groupValue,
                    valueChanged: addressSelected,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    decoration: DottedDecoration(
                      dash: const [2, 5],
                      strokeWidth: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 32.0,
              top: 24.0,
            ),
            child: GradientButton(
              onPressed: addNewAddress,
              child: Text(
                AppText.addNewAddress,
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

