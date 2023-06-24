import 'package:bookstore_app/data/model/order.dart';
import 'package:dartz/dartz.dart';

class BasketState {}

class BasketInitState extends BasketState {}

class BasketResponseState extends BasketState {
  final Either<String, List<OrderModel>> ordersResponse;
  final int totalPrice;
  BasketResponseState({
    required this.ordersResponse,
    required this.totalPrice,
  });
}
