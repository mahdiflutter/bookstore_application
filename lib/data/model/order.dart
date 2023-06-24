class OrderModel {
  final String id;
  final String name;
  final String store;
  final int discount;
  final int realPrice;
  final int count;
  OrderModel({
    required this.id,
    required this.name,
    required this.store,
    required this.discount,
    required this.realPrice,
    required this.count,
  });
}
