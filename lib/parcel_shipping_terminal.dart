import 'package:shipping_app/cost_ship_interface.dart';
import 'package:shipping_app/order.dart';
import 'package:shipping_app/order_item.dart';
import 'package:shipping_app/package_size.dart';
import 'dart:core';

class ParcelTerminalShippingStrategy implements IShippingCostsStrategy {
  @override
  String? label = "parcel shipping terminal";

//each order item is sent separately and the shipping cost depends on the parcel size.
// The final shipping price is calculated by adding up the separate shipping cost of each order item.
  @override
  double calculate(Order order) {
    //fold : Reduces a collection to a single value by iteratively
    //combining each element of the collection with an existing value
    return order.items!
        .fold<double>(0.0, (sum, item) => sum + _getShippingPrice(item));
  }

  double _getShippingPrice(OrderItem orderItem) {
    switch (orderItem.packageSize) {
      case PackageSize.xSmall:
        return 1.50;
      case PackageSize.small:
        return 2.12;
      case PackageSize.medium:
        return 3.33;
      case PackageSize.large:
        return 5.50;
      case PackageSize.xLarge:
        return 6.50;
      case PackageSize.xxLarge:
        return 8.00;
      default:
        throw Exception(
          "Unkonwn shipping price for the package of size '${orderItem.packageSize}'. ",
        );
    }
  }
}
