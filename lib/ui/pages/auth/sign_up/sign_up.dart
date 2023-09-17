import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/data/prefs.dart';
import 'package:delmer/service/auth.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:delmer/ui/custom_icons/eye_off_icons.dart';
import 'package:delmer/ui/main_nav_page.dart';
import 'package:delmer/ui/pages/auth/sign_in/sign_in.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/util/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const route = '/sign_up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  String _name = '';
  String email = '';
  String password = '';
  String passwordAgain = '';
  bool obscurePassword = true;
  bool obscurePasswordAgain = true;

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final passwordAgainFocusNode = FocusNode();

  void signUp() {
    final validation = formKey.currentState?.validate() ?? false;
    if (!validation) return;
    if (password == passwordAgain) {
      AuthService.getInstance()
          .signUp(
        _name,
        email,
        password,
      )
          .then((value) async {
        if (value != null) {
          await setAuthenticationState(true);
          if (!mounted) return;
          context.push(MainNavPage.route);
        }
      });
    }
  }

  void goToSignIn() => context.pushReplacement(SignInPage.route);

  void signInFacebook() {}

  void signInGoogle() {}

  void signInTwitter() {}

  void onEditingComplete() => FocusScope.of(context).requestFocus(emailFocusNode);

  void showPassword() => setState(() => obscurePassword = !obscurePassword);

  void showPasswordAgain() => setState(() => obscurePasswordAgain = !obscurePasswordAgain);

  void onNameChanged(String value) => setState(() => _name = value);

  void onEmailChanged(String value) => setState(() => email = value);

  void onPasswordChanged(String value) => password = value;

  void onPasswordAgainChanged(String value) => passwordAgain = value;

  @override
  Widget build(BuildContext context) => _SignUpView(this);
}

class _SignUpView extends StatefulView<SignInPage, _SignUpPageState> {
  const _SignUpView(super.state);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Form(
          key: state.formKey,
          child: FocusScope(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    bottom: 24.0,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppText.signUp,
                    style: AppTextStyle.headerStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 6.0,
                  ),
                  child: TextFormField(
                    validator: FormValidators.nameValidator,
                    onChanged: state.onNameChanged,
                    onEditingComplete: state.onEditingComplete,
                    focusNode: state.nameFocusNode,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: AppText.name,
                      suffixIcon: FormValidators.nameValidator(state._name).isEmpty
                          ? const Icon(Icons.done)
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 6.0,
                  ),
                  child: TextFormField(
                    validator: FormValidators.emailValidator,
                    textCapitalization: TextCapitalization.none,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(state.passwordFocusNode),
                    onChanged: state.onEmailChanged,
                    focusNode: state.emailFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: AppText.email,
                      suffixIcon: FormValidators.emailValidator(state.email) == null
                          ? const Icon(Icons.done)
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 6.0,
                  ),
                  child: TextFormField(
                    onChanged: state.onPasswordChanged,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(state.passwordAgainFocusNode),
                    focusNode: state.passwordFocusNode,
                    validator: FormValidators.passwordValidator,
                    obscureText: state.obscurePassword,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: AppText.password,
                      suffixIcon: IconButton(
                        onPressed: state.showPassword,
                        icon: state.obscurePassword
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(
                                EyeOff.eye_off,
                                size: 20,
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 6.0,
                  ),
                  child: TextFormField(
                    onChanged: state.onPasswordAgainChanged,
                    focusNode: state.passwordAgainFocusNode,
                    validator: FormValidators.passwordValidator,
                    obscureText: state.obscurePasswordAgain,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: AppText.confirmPassword,
                      suffixIcon: IconButton(
                        onPressed: state.showPasswordAgain,
                        icon: state.obscurePasswordAgain
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(
                                EyeOff.eye_off,
                                size: 20.0,
                              ),
                      ),
                    ),
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
                    onPressed: state.signUp,
                    child: Text(
                      AppText.signUp.toUpperCase(),
                      style: AppTextStyle.buttonStyle,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: AppText.alreadyHave,
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: AppText.signIn,
                          style: AppTextStyle.subTitleStyle1.copyWith(
                            color: AppColors.green,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = state.goToSignIn,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.h,
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
                      onPressed: state.signInFacebook,
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
                      onPressed: state.signInTwitter,
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
                      onPressed: state.signInGoogle,
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
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
