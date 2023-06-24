import 'package:hive_flutter/hive_flutter.dart';
part 'order.g.dart';

@HiveType(typeId: 1)
class OrderModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String store;
  @HiveField(3)
  final int discount;
  @HiveField(4)
  final int realPrice;
  @HiveField(5)
  int count;
  @HiveField(6)
  final String imageUrl;
  OrderModel({
    required this.id,
    required this.name,
    required this.store,
    required this.discount,
    required this.realPrice,
    required this.count,
    required this.imageUrl,
  });
}
