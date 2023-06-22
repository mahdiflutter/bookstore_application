import 'package:bookstore_app/data/datasource/product/product_data_source.dart';
import 'package:bookstore_app/data/model/comment.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailRepository {
  Future<Either<String, List<CommentModel>>> getComments();
}

class ProductDetailRepositoryNetwork extends ProductDetailRepository {
  final ProductDetailDataSource _dataSource = serviceLocator.get();
  @override
  Future<Either<String, List<CommentModel>>> getComments() async {
    try {
      final List<Map<String, dynamic>> response = await _dataSource.getDetail();
      final List<CommentModel> result = response
          .map<CommentModel>(
              (Map<String, dynamic> mapJson) => CommentModel.fromMap(mapJson))
          .toList();
      return Right(result);
    } catch (exceptipon) {
      return const Left('در ارتباط با سرور خطایی رخ داد');
    }
  }
}
