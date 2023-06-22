import 'package:bloc/bloc.dart';
import 'package:bookstore_app/bloc/category/category_event.dart';
import 'package:bookstore_app/bloc/category/category_state.dart';
import 'package:bookstore_app/data/model/category.dart';
import 'package:bookstore_app/data/repository/categories_repository.dart';
import 'package:bookstore_app/services/service_locator.dart';
import 'package:dartz/dartz.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoriesRepository _repository = serviceLocator.get();
  CategoryBloc() : super(CategoryInitState()) {
    on<CategorySendRequestEvent>((event, emit) async {
      final Either<String, List<CategoryModel>> response =
          await _repository.getAllCategories();
      emit(CategoryResponseState(response: response));
    });
  }
}
