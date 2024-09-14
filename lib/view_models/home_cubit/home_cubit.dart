import 'package:ecommerce_app/models/home_slider_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomeDate() {
    emit(HomeLoading());

    Future.delayed(const Duration(seconds: 4), () {
      emit(HomeLoaded(products: products, slider: imageList));
    });
  }

  ProductItemModel getProductById(productId) {
    emit(HomeLoaded(products: products, slider: imageList));

    return products[productId as int];
  }

  void changedState() {
    emit(HomeLoaded(products: products, slider: imageList));
  }
}
