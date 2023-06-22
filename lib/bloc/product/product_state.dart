import 'package:bookstore_app/data/model/comment.dart';
import 'package:dartz/dartz.dart';

class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseState extends ProductState {
  final Either<String, List<CommentModel>> commentsResponse;
  ProductResponseState({
    required this.commentsResponse,
  });
}
