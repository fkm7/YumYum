import 'package:flutter/material.dart';

abstract class StatefulView<W, S> extends StatelessWidget {
  const StatefulView(this.state, {super.key});

  final S state;

  W get widget => (state as State).widget as W;

  @override
  Widget build(BuildContext context);
}
