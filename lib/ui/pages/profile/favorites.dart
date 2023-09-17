import 'package:delmer/model/product.dart';
import 'package:delmer/model/venue.dart';
import 'package:delmer/ui/cards/favorite_product_card.dart';
import 'package:delmer/ui/cards/favorite_venue_card.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static const route = '/favorites';

  @override
  State<StatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int currentIndex = 0;

  final venue = Venue.fromJson({
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
  });

  final product = Product.fromJson({
    'category': 32,
    'id': 8,
    'image':
        'http://85.143.172.100:7000/media/product_images/photo_2022-07-06_14-05-46.jpg.300x300_q85.jpg',
    'institution': 9,
    'name_en': 'Roll America',
    'name_ru': 'Ролл Америка',
    'name_uz': 'Roll Amerika',
    'price': 59000,
    'price_display': 59000,
    'status': 'active',
    'url': 'http: //85.143.172.100:7000/api/products/8/',
  });

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
                color: AppColors.black,
              ),
              onPressed: () => context.pop(),
            ),
            title: Text(
              AppText.myFavorites,
              style: AppTextStyle.appBarTextStyle,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 180.w,
                  right: 180.w,
                  bottom: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () => onTabChanged(0),
                      child: currentIndex == 0
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
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
                                AppText.restaurants,
                                style: AppTextStyle.subTitleStyle0.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              child: Text(
                                AppText.restaurants,
                                style: AppTextStyle.subTitleStyle0,
                              ),
                            ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () => onTabChanged(1),
                      child: currentIndex == 1
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
                                AppText.food,
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
                                AppText.food,
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
          index: currentIndex,
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 12.0,
                right: 24.0,
                bottom: 24.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FavoriteVenueCard(
                  venue: venue,
                  onTap: () {},
                ),
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
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FavoriteProductCard(
                  product: product,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
