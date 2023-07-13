import 'package:delmer/model/product.dart';

class Order {
  Order({
    required this.restaurantName,
    required this.orderTime,
    required this.isDelivered,
    required this.cost,
    required this.products,
  });

  final String restaurantName;
  final DateTime orderTime;
  final bool isDelivered;
  final double cost;
  final List<Product> products;
}
