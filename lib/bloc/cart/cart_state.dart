import 'package:delmer/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class ProductState {
  const ProductState({
    required this.product,
    required this.count,
  });

  final Product product;
  final int count;
}

@immutable
class CartState extends Equatable {
  const CartState({
    required this.products,
    required this.subTotal,
    required this.total,
  });

  final List<Product> products;
  final double subTotal;
  final double total;

  @override
  List<Object?> get props => [];
}
