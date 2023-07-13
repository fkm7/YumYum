import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/layout/ui/auth/reset.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool successful = false;

  Widget enterEmail() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppText.forgotTitle,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 36.0,
            ),
            child: Text(
              AppText.forgotText,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.done),
                labelText: AppText.email,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            child: GradientButton(
              height: AppDimens.kButtonHeight,
              width: 1.sw,
              child: Text(
                AppText.send.toUpperCase(),
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () {
                setState(() {
                  successful = true;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget success() {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/key.svg',
          ),
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppText.resetPassword,
              style: AppTextStyle.titleStyle1.copyWith(
                color: AppColors.grey,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            AppText.lorem,
            style: AppTextStyle.subTitleStyle2.copyWith(
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(
            height: 48.0,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: GradientButton(
              height: AppDimens.kButtonHeight,
              width: 1.sw,
              child: Text(
                AppText.done.toUpperCase(),
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResetPasswordPage();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return successful ? success() : enterEmail();
  }
}
