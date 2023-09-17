import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/cards/promocode_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PromocodesPage extends StatefulWidget {
  const PromocodesPage({Key? key}) : super(key: key);

  static const route = '/promocodes';

  @override
  State<StatefulWidget> createState() => _PromocodesPageState();
}

class _PromocodesPageState extends State<PromocodesPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => _PromocodesPageView(this);
}

class _PromocodesPageView
    extends StatefulView<PromocodesPage, _PromocodesPageState> {
  const _PromocodesPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            elevation: .5,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () => context.pop(),
            ),
            title: Text(
              AppText.myPromocodes,
              style: AppTextStyle.appBarTextStyle,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 200.w,
                  right: 200.w,
                  bottom: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () => state.onTabSelected(0),
                      child: state.currentIndex == 0
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 24.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.greenLight,
                                    AppColors.green,
                                  ],
                                ),
                              ),
                              child: Text(
                                AppText.current,
                                style: AppTextStyle.subTitleStyle0.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 24.0,
                              ),
                              child: Text(
                                AppText.current,
                                style: AppTextStyle.subTitleStyle0,
                              ),
                            ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () => state.onTabSelected(1),
                      child: state.currentIndex == 1
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 24.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.greenLight,
                                    AppColors.green,
                                  ],
                                ),
                              ),
                              child: Text(
                                AppText.used,
                                style: AppTextStyle.subTitleStyle0.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 24.0,
                              ),
                              child: Text(
                                AppText.used,
                                style: AppTextStyle.subTitleStyle0,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: IndexedStack(
          index: state.currentIndex,
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 12.0,
                right: 24.0,
                bottom: 24.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: PromocodeCard(),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 12.0,
                right: 24.0,
                bottom: 24.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: PromocodeCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
