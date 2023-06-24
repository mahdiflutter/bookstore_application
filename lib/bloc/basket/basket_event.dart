import 'package:bookstore_app/data/model/order.dart';

class BasketEvent {}

class BasketSendRequestEvent extends BasketEvent {}

class BasketDeleteOrderEvent extends BasketEvent {
  final OrderModel order;
  BasketDeleteOrderEvent({required this.order});
}

class BasketIncreaseOrderCount extends BasketEvent {
  final OrderModel order;
  BasketIncreaseOrderCount({required this.order});
}

class BasketDecrementOrderCount extends BasketEvent {
  final OrderModel order;
  BasketDecrementOrderCount({required this.order});
}
