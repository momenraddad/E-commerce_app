part of 'home_cubit.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<HomeSliderModel> slider;

  final List<ProductItemModel> products;

  const HomeLoaded({required this.products, required this.slider});
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}

final class FavoritesLoaded extends HomeState {
  final List<ProductItemModel> productsF;

  const FavoritesLoaded({required this.productsF});
}

final class FavoritesLoading extends HomeState {}
