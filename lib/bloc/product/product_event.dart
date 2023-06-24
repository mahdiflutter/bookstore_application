import 'package:bookstore_app/data/model/product.dart';

class ProductEvent {}

class ProductSendRequestEvent extends ProductEvent {}

class ProductAddToBasketEvent extends ProductEvent {
  ProductModel product;
  ProductAddToBasketEvent({required this.product});
}
