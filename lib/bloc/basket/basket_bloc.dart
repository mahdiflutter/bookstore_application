import 'package:bookstore_app/bloc/basket/basket_event.dart';
import 'package:bookstore_app/bloc/basket/basket_state.dart';
import 'package:bookstore_app/data/model/order.dart';
import 'package:bookstore_app/data/repository/basket_repository.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketRepository _repository = serviceLocator.get();
  BasketBloc() : super(BasketInitState()) {
    on<BasketSendRequestEvent>(
      (event, emit) async {
        final Either<String, List<OrderModel>> ordersResponse =
            await _repository.getAllOrders();
        final int totalPriceResponse = await _repository.calcuteTotalOrders();
        emit(
          BasketResponseState(
            ordersResponse: ordersResponse,
            totalPrice: totalPriceResponse,
          ),
        );
      },
    );
  }
}
