import 'package:delmer/res/assets.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/ui/auth/sign_in.dart';
import 'package:delmer/layout/custom_components/gradient_button.dart';

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

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 48.0),
        height: 1.sh,
        width: 1.sw,
        color: Colors.white,
        child: Column(
          children: [
            if (_currentPage < 2)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        AppText.skip,
                        style:
                            AppTextStyle.subTitleStyle2.copyWith(color: AppColors.green),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: AppColors.green,
                      ),
                    ],
                  ),
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
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
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.firstIntro,
                        height: 350.h,
                        width: 400.w,
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
                      Text(
                        AppText.lorem,
                        style: AppTextStyle.subTitleStyle2.copyWith(
                          color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.secondIntro,
                        height: 350.h,
                        width: 400.w,
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
                      Text(
                        AppText.lorem,
                        style: AppTextStyle.subTitleStyle2.copyWith(
                          color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.thirdIntro,
                        height: 350.h,
                        width: 400.w,
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
                      Text(
                        AppText.lorem,
                        style: AppTextStyle.subTitleStyle2.copyWith(
                          color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
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
                  child: Text(
                    _currentPage > 1
                        ? AppText.getStarted.toUpperCase()
                        : AppText.next.toUpperCase(),
                    style: AppTextStyle.buttonStyle,
                  ),
                  onPressed: _currentPage > 1
                      ? () => Navigator.pushNamed(context, SignInPage.route)
                      : () => setState(() {
                            _currentPage++;
                            _pageController.animateToPage(
                              _currentPage,
                              duration: const Duration(
                                seconds: 1,
                              ),
                              curve: Curves.easeInOut,
                            );
                          }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
