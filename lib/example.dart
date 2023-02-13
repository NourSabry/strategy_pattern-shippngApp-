// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shipping_app/cost_ship_interface.dart';
import 'package:shipping_app/layout_constant.dart';
import 'package:shipping_app/order/order.dart';
import 'package:shipping_app/order/order_item.dart';
import 'package:shipping_app/order/order_summary.dart';
import 'package:shipping_app/shipping/in_store_package.dart';
import 'package:shipping_app/shipping/parcel_shipping_terminal.dart';
import 'package:shipping_app/shipping/prioprity_shipement.dart';
import 'package:shipping_app/shipping/sipping_options.dart';
import 'package:shipping_app/widgets/order_buttons.dart';
import 'package:shipping_app/widgets/order_items_table.dart';

class StrategyExample extends StatefulWidget {
  const StrategyExample();

  @override
  _StrategyExampleState createState() => _StrategyExampleState();
}

class _StrategyExampleState extends State<StrategyExample> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];
  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int? index) {
    setState(() {
      _selectedStrategyIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Strategy Pattern example"),
        elevation: 2,
        backgroundColor: Colors.grey,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),

          
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OrderButtons(
                onAdd: _addToOrder,
                onClear: _clearOrder,
              ),
              const SizedBox(height: LayoutConstants.spaceM),
              Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 1.0 : 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Your order is empty',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 0.0 : 1.0,
                    child: Column(
                      children: <Widget>[
                        OrderItemsTable(
                          orderItems: _order.items,
                        ),
                        const SizedBox(height: LayoutConstants.spaceM),
                        ShippingOptions(
                          selectedIndex: _selectedStrategyIndex,
                          shippingOptions: _shippingCostsStrategyList,
                          onChanged: _setSelectedStrategyIndex,
                        ),
                        OrderSummary(
                          shippingCostsStrategy: _shippingCostsStrategyList[
                              _selectedStrategyIndex],
                          order: _order,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
