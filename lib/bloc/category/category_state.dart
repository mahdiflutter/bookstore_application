import 'package:bookstore_app/data/model/category.dart';
import 'package:dartz/dartz.dart';

class CategoryState {}

class CategoryInitState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  final Either<String, List<CategoryModel>> response;
  CategoryResponseState({required this.response});
}
