import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/data/prefs.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/main_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/pages/auth/sign_in/sign_in.dart';
import 'package:delmer/ui/custom_components/gradient_button.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const route = '/intro';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 3;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Future.sync(() async {
      if (await getAuthenticationState() ?? false) {
        if (!mounted) return;
        context.replace(MainNavPage.route);
      }
      if (!(await getFirstLaunch() ?? false)) {
        if (!mounted) return;
        context.replace(SignInPage.route);
      }
    }).then((value) {
      setFirstLaunch(true);
    });
  }

  void onPressed() async {
    if (_currentPage > 1) {
      final authState = await getAuthenticationState();
      if (authState ?? false) {
        if (!mounted) return;
        context.pushReplacement(MainNavPage.route);
      }
      if (!mounted) return;
      context.pushReplacement(SignInPage.route);
    } else {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void onSkip() {
    _pageController.animateToPage(
      _numPages - 1,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
    );
  }

  void onPageChanged(int index) => setState(() => _currentPage = index);

  @override
  Widget build(BuildContext context) => _IntroView(this);
}

class _IntroView extends StatefulView<IntroPage, _IntroPageState> {
  const _IntroView(super.state);

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < state._numPages; i++) {
      indicators.add(i == state._currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 16.0,
        width: 16.0,
        decoration: BoxDecoration(
          color: isActive ? AppColors.grey : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          border: Border.all(color: AppColors.grey, width: 2.0),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            top: 48.0,
          ),
          height: 1.sh,
          width: 1.sw,
          color: Colors.white,
          child: Column(
            children: [
              if (state._currentPage < 2)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: state.onSkip,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          AppText.skip,
                          style: AppTextStyle.subTitleStyle2.copyWith(
                            color: AppColors.green,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: AppColors.green,
                        ),
                      ],
                    ),
                  ),
                )
              else
                const SizedBox(
                  height: 48.0,
                ),
              SizedBox(
                height: .6.sh,
                width: 1.sw,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: state._pageController,
                  onPageChanged: state.onPageChanged,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.firstIntro,
                          height: 450.h,
                          width: 500.w,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          AppText.firstIntroTitle,
                          style: AppTextStyle.titleStyle1.copyWith(
                            color: AppColors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48.0,
                          ),
                          child: Text(
                            AppText.lorem,
                            style: AppTextStyle.subTitleStyle2.copyWith(
                              color: AppColors.grey,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.secondIntro,
                          height: 450.h,
                          width: 500.w,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          AppText.secondIntroTitle,
                          style: AppTextStyle.titleStyle1.copyWith(
                            color: AppColors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48.0,
                          ),
                          child: Text(
                            AppText.lorem,
                            style: AppTextStyle.subTitleStyle2.copyWith(
                              color: AppColors.grey,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.thirdIntro,
                          height: 450.h,
                          width: 500.w,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          AppText.thirdIntroTitle,
                          style: AppTextStyle.titleStyle1.copyWith(
                            color: AppColors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48.0,
                          ),
                          child: Text(
                            AppText.lorem,
                            style: AppTextStyle.subTitleStyle2.copyWith(
                              color: AppColors.grey,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 32.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                  alignment: FractionalOffset.bottomCenter,
                  child: GradientButton(
                    height: AppDimens.kButtonHeight,
                    width: 1.sw,
                    onPressed: state.onPressed,
                    child: Text(
                      state._currentPage > 1
                          ? AppText.getStarted.toUpperCase()
                          : AppText.next.toUpperCase(),
                      style: AppTextStyle.buttonStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
