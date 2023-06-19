class CategoryModel {
  final String id;
  final String title;
  final String iconUrl;
  CategoryModel({
    required this.id,
    required this.title,
    required this.iconUrl,
  });
  factory CategoryModel.fromMap(Map<String, dynamic> mapJson) {
    return CategoryModel(
      id: mapJson['id'],
      title: mapJson['title'],
      iconUrl: mapJson['iconUrl'],
    );
  }
}
