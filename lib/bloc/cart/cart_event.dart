import 'package:delmer/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class CartEvent extends Equatable {}

@immutable
class ProductAdded extends CartEvent {
  ProductAdded({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

@immutable
class ProductRemoved extends CartEvent {
  ProductRemoved({required this.product});

  final Product product;
  @override
  List<Object?> get props => [product];
}

@immutable
class ProductCountIncreased extends CartEvent {
  ProductCountIncreased({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

@immutable
class ProductCountDecreased extends CartEvent {
  ProductCountDecreased({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

@immutable
class ClearAll extends CartEvent {
  @override
  List<Object?> get props => [];
}
