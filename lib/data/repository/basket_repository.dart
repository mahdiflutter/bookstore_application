import 'package:bookstore_app/data/datasource/basket/basket_data_source.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class BasketRepository {
  Future<Either<String, String>> addToBasket(ProductModel product);
}

class BasketRepositoryLocal extends BasketRepository {
  final BasketDataSource _dataSource = serviceLocator.get();
  @override
  Future<Either<String, String>> addToBasket(ProductModel product) async {
    try {
      await _dataSource.addToBasket(product);
      return const Right('با موفقیت به سبد افزوده شد.');
    } catch (exception) {
      return const Left('خطایی رخ داد!');
    }
  }
}
