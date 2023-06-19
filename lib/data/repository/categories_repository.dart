import 'package:bookstore_app/data/datasource/home/categories_data_source.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesRepository {
  Future<Either<String, List<CategoryModel>>> getAllCategories();
}

class CategoriesRepositoryNetwork extends CategoriesRepository {
  final CategoriesDataSource _dataSource = serviceLocator.get();
  @override
  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      final List<Map<String, dynamic>> response =
          await _dataSource.getAllCategories();
      final List<CategoryModel> result = response
          .map<CategoryModel>(
            (Map<String, dynamic> mapJson) => CategoryModel.fromMap(mapJson),
          )
          .toList();
      return Right(result);
    } catch (exception) {
      return const Left('در ارتباط با سرور خطایی رخ داد!');
    }
  }
}
