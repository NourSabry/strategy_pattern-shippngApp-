// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shipping_app/cost_ship_interface.dart';
import 'package:shipping_app/layout_constant.dart';
import 'package:shipping_app/order/order.dart';
import 'package:shipping_app/widgets/order_summary_row.dart';

 
class OrderSummary extends StatelessWidget {
  final Order order;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummary({
    required this.order,
    required this.shippingCostsStrategy,
  });

  double get shippingPrice => shippingCostsStrategy.calculate(order);
  double get total => order.price + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstants.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Subtotal',
              value: order.price,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Shipping',
              value: shippingPrice,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'RobotoMedium',
              label: 'Order total',
              value: total,
            ),
          ],
        ),
      ),
    );
  }
}