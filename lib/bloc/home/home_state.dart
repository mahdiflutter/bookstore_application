import 'package:bookstore_app/data/model/banner.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:dartz/dartz.dart';

class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  final Either<String, List<BannerModel>> bannersResponse;
  final Either<String, List<CategoryModel>> categoriesResponse;
  final Either<String, List<ProductModel>> productsResponse;
  HomeResponseState({
    required this.bannersResponse,
    required this.categoriesResponse,
    required this.productsResponse,
  });
}
