class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String imgUrl;
  final String writerName;
  final String publisher;
  final String translator;
  final int realPrice;
  final int discount;
  final String publishYear;
  final String pageCount;
  final String fontFamily;
  final String bookType;
  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.imgUrl,
    required this.writerName,
    required this.publisher,
    required this.translator,
    required this.realPrice,
    required this.discount,
    required this.publishYear,
    required this.pageCount,
    required this.fontFamily,
    required this.bookType,
  });
  factory ProductModel.fromMap(Map<String, dynamic> mapJson) {
    return ProductModel(
      id: mapJson['id'],
      categoryId: mapJson['categoryId'],
      name: mapJson['name'],
      imgUrl: mapJson['imgUrl'],
      writerName: mapJson['writerName'],
      publisher: mapJson['publisher'],
      translator: mapJson['translator'],
      realPrice: mapJson['realPrice'],
      discount: mapJson['discount'],
      publishYear: mapJson['publishYear'],
      pageCount: mapJson['pageCount'],
      fontFamily: mapJson['fontFamily'],
      bookType: mapJson['bookType'],
    );
  }
}
