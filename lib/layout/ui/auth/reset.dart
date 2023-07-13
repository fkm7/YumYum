import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
          AppText.resetPasswordTitle,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppText.resetPasswordText,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 12.0,
              bottom: 8.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: AppText.newPassword,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 8.0,
              bottom: 12.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: AppText.confirmPassword,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 12.0,
            ),
            child: GradientButton(
              child: Text(
                AppText.changePassword,
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
