import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/category_item.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  void getCategory() {
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(CategoryLoaded(categoryList: categoryList));
    });
  }
}
