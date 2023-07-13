import 'package:delmer/res/text.dart';
import 'package:flutter/material.dart';
import 'package:delmer/res/color.dart';
import 'package:delmer/res/style.dart';
import 'package:delmer/layout/custom_components/order_card.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);
  static const route = '/order_history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppText.orderHistory,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24.0),
        primary: true,
        shrinkWrap: false,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const OrderWidget();
        },
      ),
    );
  }
}

Widget order() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 12.0,
    ),
    child: OrderCard(
      orderTime: 'Jul 15, 2021 - 11:05 AM',
      isDelivered: true,
      restaurantName: 'Desert Show Cafe',
      cost: 36.42,
      onPressed: () {},
    ),
  );
}

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _visibility = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderCard(
          restaurantName: 'Woodstock',
          orderTime: 'Jul 15, 2021 - 15:01 AM',
          isDelivered: true,
          cost: 13.09,
          onPressed: () {
            setState(() {
              _visibility = !_visibility;
            });
          },
        ),
        Visibility(
          visible: _visibility,
          child: Column(
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cheesecake with berries x 1',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      '\$12.75',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chocolate muffin with cream x 1',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      '\$14.91',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ice cream with caramel x 1',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      '\$6.34',
                      style: AppTextStyle.subTitleStyle1.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.fillColor,
                  fixedSize: const Size(400.0, 56.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  AppText.repeatOrder.toUpperCase(),
                  style: AppTextStyle.buttonStyle.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
