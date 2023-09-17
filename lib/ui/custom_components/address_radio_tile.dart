import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:flutter/material.dart';

class AddressListRadioTile extends StatelessWidget {
  const AddressListRadioTile({
    super.key,
    required this.destination,
    required this.address,
    required this.value,
    required this.groupValue,
    required this.valueChanged,
  });

  final String destination;
  final String address;
  final Object value;
  final Object groupValue;
  final ValueChanged valueChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        destination,
        style: AppTextStyle.titleStyle0.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        address,
        style: AppTextStyle.subTitleStyle0,
        overflow: TextOverflow.ellipsis,
      ),
      groupValue: groupValue,
      onChanged: valueChanged,
      value: value,
    );
  }
}
