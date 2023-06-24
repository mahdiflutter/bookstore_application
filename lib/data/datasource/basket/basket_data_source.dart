import 'dart:ffi';

import 'package:bookstore_app/data/model/order.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/services/service_math.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BasketDataSource {
  Future<void> addToBasket(ProductModel product);
  Future<int> calcuteTotalOrders();
  Future<List<OrderModel>> getAllOrders();
  Future<void> deleteOrder({required OrderModel order});
  Future<void> increaseOrderCount({required OrderModel order});
  Future<void> decreaseOrderCount({required OrderModel order});
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
                ) *
                element.count,
      );
      return total;
    } catch (exception) {
      throw Exception('Local Data Base Error!');
    }
  }

  @override
  Future<void> deleteOrder({required OrderModel order}) async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();

      var newOrders = orders.where((element) => element.id != order.id);

      await ordersBox.clear();
      for (var x in newOrders) {
        ordersBox.add(x);
      }
    } catch (exception) {
      throw Exception('Local Data Base Error!');
    }
  }

  @override
  Future<void> increaseOrderCount({required OrderModel order}) async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();
      for (var x in orders) {
        if (x.id == order.id) {
          order.count += 1;
        }
      }
      await ordersBox.clear();
      for (var x in orders) {
        await ordersBox.add(x);
      }
    } catch (exception) {
      throw Exception('Local Data Base Error');
    }
  }

  @override
  Future<void> decreaseOrderCount({required OrderModel order}) async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();
      for (var x in orders) {
        if (x.id == order.id && x.count != 1) {
          order.count -= 1;
        }
      }
      await ordersBox.clear();
      for (var x in orders) {
        await ordersBox.add(x);
      }
    } catch (exception) {
      throw Exception('Local Data Base Error');
    }
  }
}
