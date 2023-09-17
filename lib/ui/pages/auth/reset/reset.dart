import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/service/auth.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  static const route = '/reset';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool obscurePassword = true;
  bool obscurePasswordAgain = true;
  String password = '';
  String newPassword = '';

  void pop() => Navigator.pop(context);

  void onUpdatePassword() {
    if (password == newPassword) {
      AuthService.getInstance().updatePassword(password);
    }
  }

  @override
  Widget build(BuildContext context) => _ResetView(this);
}

class _ResetView extends StatefulView<ResetPasswordPage, _ResetPasswordPageState> {
  const _ResetView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: state.pop,
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
          const Padding(
            padding: EdgeInsets.only(
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
          const Padding(
            padding: EdgeInsets.only(
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
              onPressed: state.onUpdatePassword,
              child: Text(
                AppText.changePassword,
                style: AppTextStyle.buttonStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
