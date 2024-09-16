import 'package:ecommerce_app/models/home_slider_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomeDate() {
    emit(HomeLoading());

    emit(HomeLoaded(products: products, slider: imageList));
  }

  ProductItemModel getProductById(productId) {
    final product = products.firstWhere(
      (product) => product.id == productId,
      orElse: () => throw StateError('No product found with id $productId'),
    );

    return product;
  }

  void changedState(state, String productId) {
    final product = getProductById(productId);

    if (state is HomeLoaded) {
      final updatedProducts = state.products.map((item) {
        if (item.id == productId) {
          return ProductItemModel(
              id: item.id,
              name: item.name,
              category: item.category,
              price: item.price,
              imgUrl: item.imgUrl,
              isFavorite: !item.isFavorite,
              review: item.review,
              rating: item.rating);
        }
        return item;
      }).toList();

      emit(HomeLoaded(products: updatedProducts, slider: imageList));
    } else if (state is FavoritesLoaded) {
      favoritesP();
    }
  }

  void favoritesP() {
    final newProduct = products.where((product) => product.isFavorite).toList();
    emit(FavoritesLoaded(productsF: newProduct));
  }
}
