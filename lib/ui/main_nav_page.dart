import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/ui/pages/cart/cart.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/ui/custom_icons/home_icon.dart';
import 'package:delmer/ui/custom_icons/order_icon.dart';
import 'package:delmer/ui/custom_icons/profile_icon.dart';
import 'package:delmer/ui/custom_icons/search_icon.dart';
import 'package:delmer/ui/pages/home/home.dart';
import 'package:delmer/ui/pages/profile/profile.dart';
import 'package:delmer/ui/pages/search/search.dart';
import 'package:go_router/go_router.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    if (index == 2) {
      context.push(
        CartPage.route,
        extra: {'canPop': true},
      );
    } else {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) => _MainNavPageView(this);
}

class _MainNavPageView extends StatefulView<MainNavPage, _MainNavPageState> {
  const _MainNavPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        sizing: StackFit.loose,
        index: state._currentIndex,
        children: const [
          HomePage(),
          SearchPage(),
          SizedBox(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(HomeIcon.home),
            label: AppText.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(SearchIcon.search),
            label: AppText.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(OrderIcon.order),
            label: AppText.order,
          ),
          BottomNavigationBarItem(
            icon: Icon(ProfileIcon.profile),
            label: AppText.profile,
          ),
        ],
        elevation: 0.0,
        onTap: state._onTapHandler,
        currentIndex: state._currentIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
    );
  }
}
