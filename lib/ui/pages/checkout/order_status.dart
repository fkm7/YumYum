import 'package:delmer/core/stateful_view.dart';
import 'package:delmer/ui/pages/checkout/order_failed.dart';
import 'package:delmer/ui/pages/checkout/order_success.dart';
import 'package:delmer/ui/pages/checkout/order_track.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  static const route = '/order_status';

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  bool trackOrder = false;
  bool failed = true;

  void pop() {
    context.pop();
  }

  void tryAgain() {
    setState(() {
      failed = false;
    });
  }

  void trackMyOrder() {
    setState(() {
      trackOrder = true;
    });
  }

  void continueShopping() {}

  @override
  Widget build(BuildContext context) => _OrderStatusPageView(this);
}

class _OrderStatusPageView
    extends StatefulView<OrderStatusPage, _OrderStatusPageState> {
  const _OrderStatusPageView(super.state);

  @override
  Widget build(BuildContext context) {
    return state.failed
        ? OrderFailed(tryAgain: state.tryAgain)
        : state.trackOrder
            ? const OrderTracking()
            : OrderSuccess(
                continueShopping: state.continueShopping,
                trackMyOrder: state.trackMyOrder,
              );
  }
}
