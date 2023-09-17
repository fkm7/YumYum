import 'package:delmer/model/venue.dart';
import 'package:delmer/ui/pages/cart/empty_cart.dart';
import 'package:delmer/util/formatters.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/ui/cards/favorite_venue_card.dart';
import 'package:delmer/ui/cards/cart_product_card.dart';
import 'package:delmer/ui/pages/checkout/checkout.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/dimens.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with WidgetsBindingObserver {
  AppLifecycleState? lifecycleState;
  bool isCartEmpty = true;
  bool isDeliveryFree = true;
  double subTotal = 0.0;
  double total = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    isCartEmpty = false;
  }

  @override
  void didUpdateWidget(covariant CartPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (kDebugMode) {
      print('$fn');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      lifecycleState = state;
    });
  }

  void checkout() => context.push(CheckoutPage.route);

  void pop() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) => isCartEmpty ? EmptyView(widget) : _CartView(this);
}

class _CartView extends StatefulView<CartPage, _CartPageState> {
  const _CartView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .1,
        leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: state.pop,
        ),
        title: Text(
          AppText.myOrder,
          style: AppTextStyle.appBarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            FavoriteVenueCard(
              venue: Venue.fromJson({
                'address': {
                  'id': 187,
                  'latitude': '39.64422601270283',
                  'longitude': '66.9561465177166',
                },
                'category': 1,
                'delivery_by_own': false,
                'delivery_cost': 15000,
                'description_en':
                    'Hello!\r\n\r\nWelcome to the Brighton & Magistr Bot Cafe!\r\n\r\nYour favorite gourmet, fresh dishes can now be easily ordered from the comfort of your home 🍽\r\n\r\nWe prepare and deliver following all the rules of hygiene and sanitation ✅\r\n\r\nBon appetit 😋',
                'description_ru':
                    'Здравствуйте!\r\n\r\nДобро пожаловать в бот кафе Brighton & Magistr!\r\n\r\nВаши любимые изысканные, свежие блюда теперь можно легко заказать не выходя из дома 🍽\r\n\r\nМы готовим и доставляем соблюдая все правила гигиены и санитарии ✅\r\n\r\nПриятного аппетита 😋',
                'description_uz':
                    'Salom!\r\n\r\nBot Cafe Brighton & Magistr-ga xush kelibsiz!\r\n\r\nEndi sizning sevimli mazali va yangi ovqatlaringizni uy sharoitida osongina buyurtma qilish mumkin 🍽\r\n\r\nBiz barcha gigiena va sanitariya qoidalariga muvofiq tayyorlaymiz va etkazib beramiz ✅\r\n\r\nYoqimli ishtaha 😋',
                'end_time': '22:00:00',
                'free_delivery_from': 100000,
                'id': 9,
                'image':
                    'http://85.143.172.100:7000/media/institution/images/%D0%A1%D1%82%D0%B5%D0%B9%D0%BA_T-%D0%91%D0%9E%D0%9D.png.300x300_q85.jpg',
                'is_liked': false,
                'is_open': true,
                'is_open_by_schedule': true,
                'logo':
                    'http://85.143.172.100:7000/media/institution/logos/photo_2020-10-16_17-40-45.jpg.200x200_q85.jpg',
                'max_delivery_time': 70,
                'min_delivery_time': 30,
                'name': 'Brighton',
                'phone_number': '+998 90 270 15 51',
                'position': 1,
                'rating': 4.3,
                'start_time': '00:00:00',
              }),
              onTap: () {},
              
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                        ),
                        label: '',
                        icon: Icons.cancel,
                        backgroundColor: Colors.red,
                        onPressed: (context) {},
                      ),
                    ],
                  ),
                  key: ValueKey(index),
                  child: VenueProductCard(
                    count: 2,
                    decreaseCount: () {},
                    foodName: '',
                    increaseCount: () {},
                    price: 20.0,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 24.0,
              ),
              child: Row(
                children: [
                  Text(
                    AppText.applyPromocode,
                    style: AppTextStyle.subTitleStyle2.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.subTotal,
                  style: AppTextStyle.titleStyle2,
                ),
                Text(
                  currencyFormatter.format(state.subTotal),
                  style: AppTextStyle.titleStyle2,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.delivery,
                  style: AppTextStyle.subTitleStyle2,
                ),
                Text(
                  state.isDeliveryFree ? AppText.free : '\$20',
                  style: AppTextStyle.subTitleStyle2,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              width: 1.sw,
              decoration: DottedDecoration(
                color: AppColors.dotColor,
                dash: const [2, 5],
                strokeWidth: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.total,
                  style: AppTextStyle.titleStyle2,
                ),
                Text(
                  currencyFormatter.format(state.total),
                  style: AppTextStyle.titleStyle3,
                ),
              ],
            ),
            SizedBox(height: 160.h),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: AppColors.fillColor,
          border: Border(
            top: BorderSide(
              color: AppColors.dotColor,
              width: 2.0,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 12.0,
          bottom: 32.0,
        ),
        child: ElevatedButton(
          onPressed: state.checkout,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            fixedSize: const Size(double.infinity, AppDimens.kButtonHeight),
            alignment: Alignment.center,
          ),
          child: Stack(
            children: [
              Ink(
                height: AppDimens.kButtonHeight,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.greenLight,
                      AppColors.green,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    AppText.checkout.toUpperCase(),
                    style: AppTextStyle.buttonStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 0,
                child: SvgPicture.asset(
                  AppAssets.wave,
                  fit: BoxFit.cover,
                  height: 48.0,
                  width: 48.0,
                  allowDrawingOutsideViewBox: false,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
