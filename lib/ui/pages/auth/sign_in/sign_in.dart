import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/data/prefs.dart';
import 'package:delmer/service/auth.dart';
import 'package:delmer/ui/custom_icons/eye_off_icons.dart';
import 'package:delmer/ui/pages/auth/forgot/forgot.dart';
import 'package:delmer/ui/pages/auth/sign_up/sign_up.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/pages/home/home.dart';
import 'package:delmer/util/functions.dart';
import 'package:delmer/util/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const route = '/sign_in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService.getInstance();
  String email = '';
  String password = '';
  bool obscureAgain = true;

  void onEmailChanged(String value) {
    setState(() => email = value);
  }

  void onPasswordChanged(String value) {
    setState(() => password = value);
  }

  void onEmailSaved(String? value) {
    if (value != null) {
      email = value;
    }
  }

  void onPasswordSaved(String? value) {
    if (value != null) {
      password = value;
    }
  }

  void showPassword() {
    setState(() => obscureAgain = !obscureAgain);
  }

  void onSignIn() {
    if (kDebugMode) {
      print('Form state: ${_formKey.currentState == null}');
    }
    if ((_formKey.currentState?.validate() ?? false)) {
      // _formKey.currentState!.save();
      _auth.signIn(email, password).then((value) async {
        if (value != null) {
          await setAuthenticationState(true);
          if (!mounted) return;
          context.pushReplacement(HomePage.route);
        }
      }).onError((error, stackTrace) {
        String errorMessage = getSignInErrorMessage(error.toString());
        if (kDebugMode) {
          print(errorMessage);
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            errorMessage,
            style: AppTextStyle.subTitleStyle0.copyWith(
              color: Colors.white,
            ),
          ),
        ),);
      });
    }
  }

  void onSignInWithGoogle() {
    _auth.signInWithGoogle().then((value) {
      if (value != null) {
        context.pushReplacement(HomePage.route);
      }
    }).onError((error, stackTrace) {
      String errorMessage = getSignInErrorMessage(error.toString());
      if (kDebugMode) {
        print(errorMessage);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          style: AppTextStyle.subTitleStyle0.copyWith(
            color: Colors.white,
          ),
        ),
        ),
      );
    });
  }

  void onSignInWithTwitter() {
    _auth.signInWithTwitter().then((value) {
      if (value != null) {
        context.pushReplacement(HomePage.route);
      }
    }).onError((error, stackTrace) {
      String errorMessage = getSignInErrorMessage(error.toString());
      if (kDebugMode) {
        print(errorMessage);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          style: AppTextStyle.subTitleStyle0.copyWith(
            color: Colors.white,
          ),
        ),
      ),);
    });
  }

  void onSignInWithFacebook() {
    _auth.signInWithFacebook().then((value) {
      if (value != null) {
        context.pushReplacement(HomePage.route);
      }
    }).onError((error, stackTrace) {
      String errorMessage = getSignInErrorMessage(error.toString());
      if (kDebugMode) {
        print(errorMessage);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          style: AppTextStyle.subTitleStyle0.copyWith(
            color: Colors.white,
          ),
        ),
      ),);
    });
  }

  void onSignUp() {
    context.pushReplacement(SignUpPage.route);
  }

  @override
  Widget build(BuildContext context) => _SignInView(this);
}

class _SignInView extends StatefulView<SignInPage, _SignInPageState> {
  const _SignInView(super.state);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Form(
          key: state._formKey,
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
                  onChanged: state.onEmailChanged,
                  textInputAction: TextInputAction.next,
                  validator: FormValidators.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  keyboardAppearance: Theme.of(context).brightness,
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
                  onSaved: state.onPasswordSaved,
                  onChanged: state.onPasswordChanged,
                  obscureText: state.obscureAgain,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: FormValidators.passwordValidator,
                  decoration: InputDecoration(
                    labelText: AppText.password,
                    suffixIcon: IconButton(
                      onPressed: state.showPassword,
                      icon: state.obscureAgain
                          ? const Icon(
                              Icons.remove_red_eye,
                              size: 24.0,
                            )
                          : const Icon(
                              EyeOff.eye_off,
                              size: 20.0,
                            ),
                    ),
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
                    context.push(ForgotPassword.route);
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
                  onPressed: state.onSignIn,
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
                        recognizer: TapGestureRecognizer()..onTap = state.onSignUp,
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
                    onPressed: state.onSignInWithFacebook,
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
                    onPressed: state.onSignInWithTwitter,
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
                    onPressed: state.onSignInWithGoogle,
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
    );
  }
}
