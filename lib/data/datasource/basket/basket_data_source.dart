import 'package:bookstore_app/data/model/order.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/services/service_math.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BasketDataSource {
  Future<void> addToBasket(ProductModel product);
  Future<int> calcuteTotalOrders();
  Future<List<OrderModel>> getAllOrders();
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
        imageUrl: product.imgUrl,
      );
      //Add order to orders Box
      ordersBox.add(newOrder);
    } catch (exception) {
      throw Exception('Local Data Base Error!');
    }
  }

  @override
  Future<List<OrderModel>> getAllOrders() async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();
      return orders;
    } catch (exception) {
      throw Exception('Local Data Base Error!');
    }
  }

  @override
  Future<int> calcuteTotalOrders() async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();
      var total = await orders.fold(
        0,
        (previousValue, element) =>
            previousValue +
            CustomMacth.calcuteDiscount(
              element.discount,
              element.realPrice,
            ),
      );
      return total;
    } catch (exception) {
      throw Exception('Local Data Base Error!');
    }
  }
}
