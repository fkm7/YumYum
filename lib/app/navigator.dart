import 'dart:async';

import 'package:delmer/data/prefs.dart';
import 'package:delmer/model/product.dart';
import 'package:delmer/model/venue.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/ui/main_nav_page.dart';
import 'package:delmer/ui/pages/auth/forgot/forgot.dart';
import 'package:delmer/ui/pages/auth/reset/reset.dart';
import 'package:delmer/ui/pages/auth/sign_in/sign_in.dart';
import 'package:delmer/ui/pages/auth/sign_up/sign_up.dart';
import 'package:delmer/ui/pages/auth/verification/verification.dart';
import 'package:delmer/ui/pages/cart/cart.dart';
import 'package:delmer/ui/pages/checkout/checkout.dart';
import 'package:delmer/ui/pages/checkout/order_status.dart';
import 'package:delmer/ui/pages/home/all_offers.dart';
import 'package:delmer/ui/pages/home/home.dart';
import 'package:delmer/ui/pages/home/view_venues.dart';
import 'package:delmer/ui/pages/intro/intro.dart';
import 'package:delmer/ui/pages/intro/splash.dart';
import 'package:delmer/ui/pages/profile/add_new_address.dart';
import 'package:delmer/ui/pages/profile/add_new_card.dart';
import 'package:delmer/ui/pages/profile/address.dart';
import 'package:delmer/ui/pages/profile/edit_card.dart';
import 'package:delmer/ui/pages/profile/edit_profile.dart';
import 'package:delmer/ui/pages/profile/favorites.dart';
import 'package:delmer/ui/pages/profile/order_history.dart';
import 'package:delmer/ui/pages/profile/payment_method.dart';
import 'package:delmer/ui/pages/profile/promocode.dart';
import 'package:delmer/ui/pages/product_detail/product_detail.dart';
import 'package:delmer/ui/pages/explore/explore.dart';
import 'package:delmer/ui/pages/search/search_filter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:delmer/model/category.dart' as cat;
import 'app.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  /// Creates a [GoRouterRefreshStream].
  ///
  /// Every time the [stream] receives an event the [GoRouter] will refresh its
  /// current route.
  GoRouterRefreshStream(Stream stream) {
    // notifyListeners();
    _subscription = stream.asBroadcastStream().listen((dynamic data) {
      notifyListeners();
    });
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final goRouter = GoRouter(
  initialLocation: IntroPage.route,
  debugLogDiagnostics: kDebugMode,
  refreshListenable: GoRouterRefreshStream(app.stream),
  errorBuilder: (context, state) => Material(
    child: Center(
      child: Text(
        AppText.error,
        style: AppTextStyle.headerLargeStyle.copyWith(
          color: AppColors.red,
        ),
      ),
    ),
  ),
  redirect: (context, state) {
    if (state.path == '/') {
      return getFirstLaunch().then((value) async {
        if (value ?? false) {
          final authState = await getAuthenticationState();
          if (authState ?? false) {
            return MainNavPage.route;
          }
          return HomePage.route;
        } else {
          return IntroPage.route;
        }
      });
    }
    if (kDebugMode) {
      print(state.location);
    }
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: SplashPage.route,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: IntroPage.route,
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      path: SignInPage.route,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: SignUpPage.route,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: ForgotPassword.route,
      builder: (context, state) => const ForgotPassword(),
    ),
    GoRoute(
      path: ResetPasswordPage.route,
      builder: (context, state) => const ResetPasswordPage(),
    ),
    GoRoute(
      path: VerificationPage.route,
      builder: (context, state) => const VerificationPage(),
    ),
    GoRoute(
      path: MainNavPage.route,
      builder: (context, state) => const MainNavPage(),
    ),
    GoRoute(
      path: ViewVenuesPage.route,
      builder: (context, state) => ViewVenuesPage(
        category: state.extra as cat.Category,
      ),
    ),
    GoRoute(
      path: SearchFilterPage.route,
      builder: (context, state) => const SearchFilterPage(),
    ),
    GoRoute(
      path: ExplorePage.route,
      builder: (context, state) =>
          ExplorePage(restaurant: state.extra as Venue),
    ),
    GoRoute(
      path: ProductDetailPage.route,
      builder: (context, state) =>
          ProductDetailPage(product: state.extra as Product),
    ),
    GoRoute(
      path: CartPage.route,
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: CheckoutPage.route,
      builder: (context, state) => const CheckoutPage(),
    ),
    GoRoute(
      path: OrderStatusPage.route,
      builder: (context, state) => const OrderStatusPage(),
    ),
    GoRoute(
      path: EditProfilePage.route,
      builder: (context, state) => const EditProfilePage(),
    ),
    GoRoute(
      path: OrderHistoryPage.route,
      builder: (context, state) => const OrderHistoryPage(),
    ),
    GoRoute(
      path: PaymentMethodPage.route,
      builder: (context, state) => const PaymentMethodPage(),
    ),
    GoRoute(
      path: AddressPage.route,
      builder: (context, state) => const AddressPage(),
    ),
    GoRoute(
      path: PromocodesPage.route,
      builder: (context, state) => const PromocodesPage(),
    ),
    GoRoute(
      path: FavoritesPage.route,
      builder: (context, state) => const FavoritesPage(),
    ),
    GoRoute(
      path: AllOffersPage.route,
      builder: (context, state) => const AllOffersPage(),
    ),
    GoRoute(
      path: AddNewCardPage.route,
      builder: (context, state) => const AddNewCardPage(),
    ),
    GoRoute(
      path: AddNewAddress.route,
      builder: (context, state) => const AddNewAddress(),
    ),
    GoRoute(
      path: EditCardPage.route,
      builder: (context, state) => const EditCardPage(),
    ),
  ],
);
