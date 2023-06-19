import 'package:bookstore_app/data/datasource/home/banners_data_source.dart';
import 'package:bookstore_app/data/repository/banners_repository.dart';
import 'package:get_it/get_it.dart';

var serviceLocator = GetIt.instance;
Future<void> initGetIt() async {
  //Data Sources
  serviceLocator.registerSingleton<BannersDataSource>(
    BannersDataSourceNetwork(),
  );

  //Repositories
  serviceLocator.registerSingleton<BannersRepository>(
    BannersRepositoryNetwork(),
  );
  //Bloc
  //Other
}
