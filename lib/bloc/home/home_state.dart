import 'package:bookstore_app/data/model/banner.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:dartz/dartz.dart';

class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  final Either<String, List<BannerModel>> bannersResponse;
  final Either<String, List<CategoryModel>> categoriesResponse;
  HomeResponseState({
    required this.bannersResponse,
    required this.categoriesResponse,
  });
}
