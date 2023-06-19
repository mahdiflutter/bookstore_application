class BannerModel {
  final String id;
  final String urlAddress;
  BannerModel({required this.id, required this.urlAddress});
  factory BannerModel.fromMap(Map<String, dynamic> mapJson) {
    return BannerModel(
      id: mapJson['id'],
      urlAddress: mapJson['urlAddress'],
    );
  }
}
