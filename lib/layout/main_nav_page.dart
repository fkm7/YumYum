import 'package:delmer/layout/ui/order/cart.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/layout/custom_icons/home_icon.dart';
import 'package:delmer/layout/custom_icons/order_icon.dart';
import 'package:delmer/layout/custom_icons/profile_icon.dart';
import 'package:delmer/layout/custom_icons/search_icon.dart';
import 'package:delmer/layout/ui/home/home.dart';
import 'package:delmer/layout/ui/order/order.dart';
import 'package:delmer/layout/ui/profile/profile.dart';
import 'package:delmer/layout/ui/search/search.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        sizing: StackFit.loose,
        index: _currentIndex,
        children: const [
          HomePage(),
          SearchPage(),
          CartPage(),
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
        elevation: 3.0,
        onTap: _onTapHandler,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
    );
  }
}
