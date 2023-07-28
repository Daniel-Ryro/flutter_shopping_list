import 'package:intl/intl.dart';

String formatPrice(double price) {
  final format = NumberFormat.currency(
    locale: Intl.defaultLocale,
    symbol: '', 
  );
  return format.format(price);
}
