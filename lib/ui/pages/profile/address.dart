import 'package:delmer/model/address.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/ui/custom_icons/home_icon.dart';
import 'package:delmer/ui/pages/profile/add_new_address.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/res/style.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  static const route = '/address';

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
          
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: GradientButton(
              child: Text(
                AppText.addNewAddress,
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () => context.push(AddNewAddress.route),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            address.title,
              style: AppTextStyle.titleStyle0.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
            address.toString(),
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
      ],
    );
  }
}
