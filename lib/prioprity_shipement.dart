import 'package:shipping_app/cost_ship_interface.dart';
import 'package:shipping_app/order.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String? label = "priority shipping";

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
