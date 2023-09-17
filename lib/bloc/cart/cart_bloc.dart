import 'package:bloc/bloc.dart';
import 'package:delmer/bloc/cart/cart_event.dart';
import 'package:delmer/bloc/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(super.initialState) {
    on<ProductAdded>((event, emit) => null);
    on<ProductRemoved>((event, emit) => null);
    on<ProductCountIncreased>((event, emit) => null);
    on<ProductCountDecreased>((event, emit) => null);
    on<ClearAll>((event, emit) => null);
  }
}
