import 'package:bookstore_app/data/model/order.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BasketDataSource {
  Future<void> addToBasket(ProductModel product);
}

class BasketDataSourceLocal extends BasketDataSource {
  var ordersBox = Hive.box<OrderModel>('orders');
  @override
  Future<void> addToBasket(ProductModel product) async {
    try {
      //Create new Order from Product Information
      final OrderModel newOrder = OrderModel(
        id: product.id,
        name: product.name,
        store: 'بوک استور',
        discount: product.discount,
        realPrice: product.realPrice,
        count: 1,
      );
      //Add order to orders Box
      ordersBox.add(newOrder);
    } catch (exception) {
      throw Exception('Local Data Base Error!');
    }
  }
}
