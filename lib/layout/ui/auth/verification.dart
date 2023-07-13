import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/layout/main_nav_page.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  static const route = '/verification';

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final pinLength = 6;
  bool show = false;

  final _defaultPinTheme = PinTheme(
    height: 96.h,
    width: 96.w,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.fillColor,
      border: Border.all(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    ),
  );
  late final _focusedPinTheme = _defaultPinTheme.copyDecorationWith(
    border: Border.all(
      color: const Color.fromRGBO(114, 178, 238, 1),
    ),
  );

  late final _submittedPinTheme = _defaultPinTheme.copyWith(
    decoration: _defaultPinTheme.decoration!.copyWith(
      color: AppColors.pinPutFilledColor,
    ),
  );

  Widget _enterPhonePage() {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 32.0,
              right: 24.0,
            ),
            child: Text(
              AppText.weSentSms,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verifyOTP() {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 32.0,
              bottom: 24.0,
            ),
            child: Text(
              AppText.enterOTP,
              style: AppTextStyle.subTitleStyle2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
          Pinput(
            length: pinLength,
            defaultPinTheme: _defaultPinTheme,
            focusedPinTheme: _focusedPinTheme,
            submittedPinTheme: _submittedPinTheme,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 24.0,
              bottom: 24.0,
            ),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text: AppText.didntReceive,
                style: AppTextStyle.subTitleStyle2.copyWith(
                  color: AppColors.grey,
                ),
                children: [
                  TextSpan(
                    text: ' ${AppText.resend}',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: AppTextStyle.subTitleStyle2.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: GradientButton(
              height: AppDimens.kButtonHeight,
              width: 1.sw,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.greenLight,
                  AppColors.green,
                ],
              ),
              child: Text(
                AppText.verify.toUpperCase(),
                style: AppTextStyle.buttonStyle,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(MainNavPage.route);
              },
            ),
          ),
        ],
      ),
    );
  }

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
          AppText.verifyTitle,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: show ? _enterPhonePage() : _verifyOTP(),
    );
  }
}
