import "package:flutter_bloc/flutter_bloc.dart";
// import 'package:ecommerce_app/models/home_slider_model.dart';
// import 'package:ecommerce_app/models/product_item_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchResult> {
  SearchCubit()
      : super(SearchResult(
            PopularSearch: [],
            lastSearch: [])); // توفير القيم الافتراضية للـ product و lastSearch

  void getData() {
    emit(SearchResult(
      PopularSearch: pro,
      lastSearch: lastSearchReady,
    ));
  }

  void remove(itemD) {
    List<SearchState> newPro =
        state.PopularSearch ?? []; // تأكد من أن القائمة غير فارغة
    List<SearchState> newLastSearch =
        state.lastSearch ?? []; // تأكد من أن القائمة غير فارغة

    if (itemD == "ClearALL") {
      newLastSearch = []; // إذا كان الطلب هو مسح الكل، امسح قائمة lastSearch
    } else {
      newLastSearch.removeWhere((element) => element == itemD);
    }

    emit(SearchResult(
        PopularSearch: newPro,
        lastSearch: newLastSearch)); // تأكد من توفير lastSearch أيضًا
  }
}
