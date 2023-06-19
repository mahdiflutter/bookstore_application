import 'package:bloc/bloc.dart';
import 'package:bookstore_app/bloc/home/home_event.dart';
import 'package:bookstore_app/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetDataEvent>((event, emit) async {
      emit(HomeLoadingState());
      await Future.delayed(
        const Duration(seconds: 3),
      );
    });
  }
}
