import 'package:bookstore_app/data/datasource/home/banners_data_source.dart';
import 'package:bookstore_app/data/model/banner.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class BannersRepository {
  Future<Either<String, List<BannerModel>>> getAllBanners();
}

class BannersRepositoryNetwork extends BannersRepository {
  final BannersDataSource _dataSource = serviceLocator.get();
  @override
  Future<Either<String, List<BannerModel>>> getAllBanners() async {
    try {
      var response = await _dataSource.getAllBanners();
      List<BannerModel> result = response
          .map<BannerModel>(
              (Map<String, dynamic> mapJson) => BannerModel.fromMap(mapJson))
          .toList();
      return Right(result);
    } catch (exception) {
      return const Left('در ارتباط با سرور خطایی رخ داد!');
    }
  }
}
