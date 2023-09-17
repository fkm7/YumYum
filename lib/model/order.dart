import 'package:delmer/model/product.dart';

class Order {
  Order({
    required this.restaurantName,
    required this.orderTime,
    required this.isDelivered,
    required this.cost,
    required this.products,
    required this.deliveryAddress,
  });

  factory Order.fromJson(Map json) => Order(
        restaurantName: json['restaurant_name'],
        orderTime: json['order_time'],
        isDelivered: json['is_delivered'],
        cost: json['cost'],
        products: json['products'],
        deliveryAddress: json['delivery_address'],
      );

  final double cost;
  final bool isDelivered;
  final DateTime orderTime;
  final String restaurantName;
  final List<Product> products;
  final String deliveryAddress;

  Order copyWith(
    double? cost,
    bool? isDelivered,
    DateTime? orderTime,
    String? restaurantName,
    List<Product>? products,
    String? deliveryAddress,
  ) =>
      Order(
        cost: cost ?? this.cost,
        products: products ?? this.products,
        orderTime: orderTime ?? this.orderTime,
        isDelivered: isDelivered ?? this.isDelivered,
        restaurantName: restaurantName ?? this.restaurantName,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      );

  Map toJson() => {
        'restaurant_time': restaurantName,
        'order_time': orderTime,
        'is_delivered': isDelivered,
        'cost': cost,
        'products': products,
        'delivery_address': deliveryAddress,
      };

  @override
  bool operator ==(Object other) =>
      other is Order &&
      other.runtimeType == runtimeType &&
      other.cost == cost &&
      other.deliveryAddress == deliveryAddress &&
      other.isDelivered == isDelivered &&
      other.orderTime == orderTime &&
      other.products == products &&
      other.restaurantName == restaurantName;

  @override
  int get hashCode =>
      Object.hash(this, cost, deliveryAddress, isDelivered, orderTime, products, restaurantName);
}
