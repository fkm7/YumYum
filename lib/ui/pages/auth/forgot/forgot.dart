import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/service/auth.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const route = '/forgot';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  bool successful = false;
  String email = '';

  void pop() => Navigator.pop(context);

  void emailAddressChanged(String value) => setState(() => email = value);

  void onSend() {
    final formState = _formKey.currentState?.validate();
    if (formState ?? false) {
      AuthService.getInstance()
          .forgotPassword(email)
          .then((_) => setState(() => successful = true));
    }
  }

  void onDone() => context.pop();

  @override
  Widget build(BuildContext context) =>
      successful ? _SuccessfulView(this) : _EnterEmailView(this);
}

class _SuccessfulView extends StatefulView<ForgotPassword, _ForgotPasswordState> {
  const _SuccessfulView(super.state);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.keyAssets,
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
              onPressed: state.onDone,
              child: Text(
                AppText.done.toUpperCase(),
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnterEmailView extends StatefulView<ForgotPassword, _ForgotPasswordState> {
  const _EnterEmailView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: state.pop,
        ),
        title: Text(
          AppText.forgotTitle,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Form(
        key: state._formKey,
        child: Column(
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
              child: TextFormField(
                validator: FormValidators.emailValidator,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                onChanged: state.emailAddressChanged,
                decoration: InputDecoration(
                  labelText: AppText.email,
                  suffixIcon: FormValidators.emailValidator(state.email) == null
                      ? const Icon(Icons.done)
                      : null,
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
                onPressed: state.onSend,
                child: Text(
                  AppText.send.toUpperCase(),
                  style: AppTextStyle.buttonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
