import 'package:shipping_app/order.dart';

abstract class IShippingCostsStrategy {
  String? label;
  double calculate(Order order);
}
