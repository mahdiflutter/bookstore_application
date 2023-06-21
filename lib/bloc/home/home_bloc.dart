import 'package:bloc/bloc.dart';
import 'package:bookstore_app/bloc/home/home_event.dart';
import 'package:bookstore_app/bloc/home/home_state.dart';
import 'package:bookstore_app/data/model/banner.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/data/model/product.dart';
import 'package:bookstore_app/data/repository/banners_repository.dart';
import 'package:bookstore_app/data/repository/categories_repository.dart';
import 'package:bookstore_app/data/repository/products_repository.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BannersRepository _bannersRepository = serviceLocator.get();
  final CategoriesRepository _categoriesRepository = serviceLocator.get();
  final ProductsRepository _productsRepository = serviceLocator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetDataEvent>((event, emit) async {
      emit(HomeLoadingState());
      await Future.delayed(
        const Duration(seconds: 3),
      );
      Either<String, List<BannerModel>> bannersResponse =
          await _bannersRepository.getAllBanners();
      Either<String, List<CategoryModel>> categoriesRespose =
          await _categoriesRepository.getAllCategories();
      Either<String, List<ProductModel>> productsResponse =
          await _productsRepository.getAllProducts();
      emit(
        HomeResponseState(
          bannersResponse: bannersResponse,
          categoriesResponse: categoriesRespose,
          productsResponse: productsResponse,
        ),
      );
    });
  }
}
