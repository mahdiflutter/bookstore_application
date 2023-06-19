import 'package:bloc/bloc.dart';
import 'package:bookstore_app/bloc/home/home_event.dart';
import 'package:bookstore_app/bloc/home/home_state.dart';
import 'package:bookstore_app/data/model/banner.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/data/repository/banners_repository.dart';
import 'package:bookstore_app/data/repository/categories_repository.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BannersRepository _bannersRepository = serviceLocator.get();
  final CategoriesRepository _categoriesRepository = serviceLocator.get();
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
      emit(
        HomeResponseState(
          bannersResponse: bannersResponse,
          categoriesResponse: categoriesRespose,
        ),
      );
    });
  }
}
