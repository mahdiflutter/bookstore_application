import 'package:bookstore_app/bloc/basket/basket_bloc.dart';
import 'package:bookstore_app/data/datasource/basket/basket_data_source.dart';
import 'package:bookstore_app/data/datasource/home/banners_data_source.dart';
import 'package:bookstore_app/data/datasource/home/categories_data_source.dart';
import 'package:bookstore_app/data/datasource/home/products_data_source.dart';
import 'package:bookstore_app/data/datasource/product/product_data_source.dart';
import 'package:bookstore_app/data/repository/banners_repository.dart';
import 'package:bookstore_app/data/repository/basket_repository.dart';
import 'package:bookstore_app/data/repository/categories_repository.dart';
import 'package:bookstore_app/data/repository/product_repository.dart';
import 'package:bookstore_app/data/repository/products_repository.dart';
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
  serviceLocator.registerSingleton<ProductsDataSource>(
    ProductsDataSourceNetwork(),
  );
  serviceLocator.registerSingleton<ProductDetailDataSource>(
    ProductDetailDataSourceNetwork(),
  );
  serviceLocator.registerSingleton<BasketDataSource>(
    BasketDataSourceLocal(),
  );

  //Repositories
  serviceLocator.registerSingleton<BannersRepository>(
    BannersRepositoryNetwork(),
  );
  serviceLocator.registerSingleton<CategoriesRepository>(
    CategoriesRepositoryNetwork(),
  );
  serviceLocator.registerSingleton<ProductsRepository>(
    ProductsRepositoryNetwork(),
  );
  serviceLocator.registerSingleton<ProductDetailRepository>(
    ProductDetailRepositoryNetwork(),
  );
  serviceLocator.registerSingleton<BasketRepository>(
    BasketRepositoryLocal(),
  );
  //Bloc
  serviceLocator.registerSingleton<BasketBloc>(
    BasketBloc(),
  );
  //Other
}
