import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shipping_app/Order.dart';
import 'package:shipping_app/cost_ship_interface.dart';
import 'package:shipping_app/in_store_package.dart';
import 'package:shipping_app/order_item.dart';
import 'package:shipping_app/parcel_shipping_terminal.dart';
import 'package:shipping_app/prioprity_shipement.dart';

class StrategyExampleState extends StatefulWidget {
  const StrategyExampleState({super.key});

  @override
  State<StrategyExampleState> createState() => _StrategyExampleStateState();
}

class _StrategyExampleStateState extends State<StrategyExampleState> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    PriorityShippingStrategy(),
    ParcelTerminalShippingStrategy(),
  ];
  int _selectedIndex = 0;
  Order? _order;

  void addOrder() {
    setState(() {
      _order!.addOrderItem(
        OrderItem.random(),
      );
    });
  }

  void clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void setSelectedStrategyIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Controls how Scrollable widgets behave in a subtree. The scroll configuration
    // determines the ScrollPhysics and viewport decorations used by descendants of child.
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        
      ),
    );
  }
}
