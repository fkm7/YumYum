import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/layout/ui/profile/add_new_address.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_icons/home_icon.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

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
          AppText.myAddress,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            width: double.infinity,
            child: DecoratedBox(
              decoration: DottedDecoration(
                shape: Shape.line,
                dash: const [2, 6],
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 12.0,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            leading: const Icon(
              HomeIcon.home,
            ),
            title: Text(
              'Home',
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '4140 Parker Rd. Allentown, New Mexico 31134',
              style: AppTextStyle.subTitleStyle0,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 64.0,
              right: 32.0,
            ),
            height: 0.0,
            width: double.infinity,
            child: DecoratedBox(
              decoration: DottedDecoration(
                shape: Shape.line,
                dash: const [2, 6],
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 12.0,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            leading: const Icon(
              HomeIcon.home,
            ),
            title: Text(
              'Home',
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '4140 Parker Rd. Allentown, New Mexico 31134',
              style: AppTextStyle.subTitleStyle0,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 64.0,
              right: 32.0,
            ),
            height: 0.0,
            width: double.infinity,
            child: DecoratedBox(
              decoration: DottedDecoration(
                shape: Shape.line,
                dash: const [2, 6],
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 12.0,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            leading: const Icon(
              HomeIcon.home,
            ),
            title: Text(
              'Home',
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '4140 Parker Rd. Allentown, New Mexico 31134',
              style: AppTextStyle.subTitleStyle0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: GradientButton(
              child: Text(
                AppText.addNewAddress,
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddNewAddress();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
