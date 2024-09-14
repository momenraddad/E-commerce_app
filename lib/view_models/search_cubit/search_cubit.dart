import "package:flutter_bloc/flutter_bloc.dart";

part 'search_state.dart';

class SearchCubit extends Cubit<SearchResult> {
  SearchCubit() : super(SearchResult(PopularSearch: [], lastSearch: []));

  void getData() {
    emit(SearchResult(
      PopularSearch: pro,
      lastSearch: lastSearchReady,
    ));
  }

  void remove(itemD) {
    List<SearchState> newPro = state.PopularSearch ?? [];
    List<SearchState> newLastSearch = state.lastSearch ?? [];

    if (itemD == "ClearALL") {
      newLastSearch = [];
    } else {
      newLastSearch.removeWhere((element) => element == itemD);
    }

    emit(SearchResult(PopularSearch: newPro, lastSearch: newLastSearch));
  }
}
