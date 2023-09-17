import 'package:delmer/model/category.dart';
import 'package:delmer/model/venue.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/ui/cards/venue_card.dart';
import 'package:delmer/ui/pages/explore/explore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewVenuesPage extends StatelessWidget {
  ViewVenuesPage({super.key, required this.category});

  final Category category;

  static String route = '/venues';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            elevation: .5,
            forceElevated: innerBoxIsScrolled,
            title: Text(
              category.title,
              style: AppTextStyle.appBarTextStyle,
            ),
          ),
        ],
        body: ListView.builder(
          padding: const EdgeInsets.all(24.0),
          itemCount: 30,
          itemBuilder: (context, index) => VenueCard(
            venue: venue,
            onPressed: () {
              context.push(
                ExplorePage.route,
                extra: venue,
              );
            },
          ),
        ),
      ),
    );
  }
}
