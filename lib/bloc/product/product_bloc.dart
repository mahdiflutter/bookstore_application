import 'package:bloc/bloc.dart';
import 'package:bookstore_app/bloc/product/product_event.dart';
import 'package:bookstore_app/bloc/product/product_state.dart';
import 'package:bookstore_app/data/model/comment.dart';
import 'package:bookstore_app/data/repository/basket_repository.dart';
import 'package:bookstore_app/data/repository/product_repository.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductDetailRepository _commentsRepository = serviceLocator.get();
  final BasketRepository _basketRepository = serviceLocator.get();
  ProductBloc() : super(ProductInitState()) {
    on<ProductSendRequestEvent>((event, emit) async {
      emit(ProductLoadingState());
      await Future.delayed(const Duration(seconds: 3));

      final Either<String, List<CommentModel>> commentsResponse =
          await _commentsRepository.getComments();
      emit(
        ProductResponseState(
          commentsResponse: commentsResponse,
        ),
      );
    });
    on<ProductAddToBasketEvent>(
      (event, emit) async {
        Either<String, String> basketDataSource =
            await _basketRepository.addToBasket(event.product);
        final Either<String, List<CommentModel>> commentsResponse =
            await _commentsRepository.getComments();
        emit(
          ProductAddedToBasketState(
            response: basketDataSource,
            commentsResponse: commentsResponse,
          ),
        );
      },
    );
  }
}
