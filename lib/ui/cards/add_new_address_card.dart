import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewAddressCard extends StatefulWidget {
  const AddNewAddressCard({Key? key}) : super(key: key);

  @override
  State<AddNewAddressCard> createState() => _AddNewAddressCardState();
}

class _AddNewAddressCardState extends State<AddNewAddressCard> {
  final _groupValue = '';
  var value = '';

  @override
  Widget build(BuildContext context) {
    return _AddNewAddressCardView(this);
  }
}

class _AddNewAddressCardView
    extends StatefulView<AddNewAddressCard, _AddNewAddressCardState> {
  const _AddNewAddressCardView(super.widget);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        height: 0.45.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.addNewAddress,
              style: AppTextStyle.titleStyle2.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: AppText.title.toUpperCase(),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: AppText.newAddress.toUpperCase(),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Radio<String>(
                  value: state.value,
                  groupValue: state._groupValue,
                  onChanged: (value) {},
                ),
                Text(
                  AppText.useCurrentLocation,
                  style: AppTextStyle.subTitleStyle2.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
