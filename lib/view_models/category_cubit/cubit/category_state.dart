part of 'category_cubit.dart';

final class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<CategoryItem> categoryList;

  CategoryLoaded({required this.categoryList});
}

final class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
}
