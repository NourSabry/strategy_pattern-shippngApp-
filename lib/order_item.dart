import 'package:shipping_app/package_size.dart';
import 'package:faker/faker.dart';

class OrderItem {
  String? title;
  double? price;
  PackageSize? packageSize;

  OrderItem.random() {
    var packageSizeList = PackageSize.values;

    title = faker.lorem.word();
    price = random.integer(100, min: 5) - 0.01;
    packageSize = packageSizeList[random.integer(
      packageSizeList.length,
    )];
  }
}
