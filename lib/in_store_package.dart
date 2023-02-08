import 'package:shipping_app/cost_ship_interface.dart';

import 'order.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String? label = "in store products";

  @override
  double calculate(Order order) {
    return 0.0;
  }
}
