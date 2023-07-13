import 'package:delmer/bloc/app/app_state.dart';
import 'package:delmer/layout/ui/auth/forgot.dart';
import 'package:delmer/layout/ui/auth/sign_up.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/gradient_button.dart';
import 'package:delmer/layout/ui/auth/verification.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const route = '/auth';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 24.0,
                bottom: 24.0,
                top: 256.h,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                AppText.signIn,
                style: AppTextStyle.headerStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 6.0,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.done),
                  labelText: AppText.email,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 6.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                  labelText: AppText.password,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 24.0),
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  AppText.forgot,
                  style: AppTextStyle.subTitleStyle1.copyWith(
                    color: AppColors.green,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgotPassword();
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 12.0,
                right: 24.0,
              ),
              child: GradientButton(
                height: AppDimens.kButtonHeight,
                width: 1.sw,
                onPressed: () {
                  Navigator.of(context).pushNamed(VerificationPage.route);
                },
                child: Text(
                  AppText.signIn.toUpperCase(),
                  style: AppTextStyle.buttonStyle,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: AppText.dontHaveAccount,
                  style: AppTextStyle.subTitleStyle1.copyWith(
                    color: AppColors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: AppText.signUp,
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.green,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const SignUpPage();
                          }));
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: AppColors.purple,
                        width: 3.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    height: 64.0,
                    width: 64.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.purple,
                        width: 2.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppAssets.facebook,
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: AppColors.blue,
                        width: 3.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    height: 64.0,
                    width: 64.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.blue,
                        width: 2.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppAssets.twitter,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: AppColors.red,
                        width: 3.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    height: 64.0,
                    width: 64.0,
                    child: SvgPicture.asset(
                      AppAssets.google,
                      fit: BoxFit.fill,
                    ),
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
