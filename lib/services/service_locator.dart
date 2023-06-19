import 'package:bookstore_app/data/datasource/home/banners_data_source.dart';
import 'package:bookstore_app/data/datasource/home/categories_data_source.dart';
import 'package:bookstore_app/data/repository/banners_repository.dart';
import 'package:bookstore_app/data/repository/categories_repository.dart';
import 'package:get_it/get_it.dart';

var serviceLocator = GetIt.instance;
Future<void> initGetIt() async {
  //Data Sources
  serviceLocator.registerSingleton<BannersDataSource>(
    BannersDataSourceNetwork(),
  );
  serviceLocator.registerSingleton<CategoriesDataSource>(
    CategoriesDataSourceNetwork(),
  );

  //Repositories
  serviceLocator.registerSingleton<BannersRepository>(
    BannersRepositoryNetwork(),
  );
  serviceLocator.registerSingleton<CategoriesRepository>(
    CategoriesRepositoryNetwork(),
  );
  //Bloc
  //Other
}
