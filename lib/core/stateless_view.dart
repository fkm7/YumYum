import 'package:flutter/material.dart';

abstract class StatelessView<W> extends StatelessWidget {
  const StatelessView(this.widget, {super.key});

  final W widget;

  @override
  Widget build(BuildContext context);
}
