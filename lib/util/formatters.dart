import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(
  locale: 'en_US',
  name: '\$',
  symbol: '\$',
  decimalDigits: 0,
);
