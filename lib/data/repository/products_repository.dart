import 'package:bookstore_app/data/datasource/home/products_data_source.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either<String, List<ProductModel>>> getAllProducts();
}

class ProductsRepositoryNetwork extends ProductsRepository {
  final ProductsDataSource _dataSource = serviceLocator.get();
  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      final List<Map<String, dynamic>> response =
          await _dataSource.getAllProducts();
      final List<ProductModel> result = response
          .map<ProductModel>(
            (Map<String, dynamic> mapJson) => ProductModel.fromMap(mapJson),
          )
          .toList();
      return Right(result);
    } catch (exception) {
      return const Left('در ارتباط با سرور خطایی رخ داد!');
    }
  }
}
