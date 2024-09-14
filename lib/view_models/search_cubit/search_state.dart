part of 'search_cubit.dart';

class SearchState {
  final String name;
  final String imageUrl;
  final String rating;
  final String searchTod;

  SearchState(
      {this.name = '',
      this.imageUrl = '',
      this.rating = '',
      this.searchTod = ''});
  @override
  String toString() {
    return 'SearchState(name: $name, imageUrl: $imageUrl, rating: $rating, searchTod: $searchTod)';
  }

  get PopularSearch => null;
}

final class SearchResult extends SearchState {
  List<SearchState>? PopularSearch;
  List<SearchState>? lastSearch;

  SearchResult({
    this.PopularSearch = const [],
    this.lastSearch = const [],
  });
}

List<SearchState> pro = [
  SearchState(
      name: "Sporty Twin Look",
      imageUrl:
          "https://img.freepik.com/premium-photo/boy-with-curly-hair-wearing-trendy-clothes-pastel-color-background_758367-32316.jpg",
      searchTod: "1.6K",
      rating: "Hot"),
  SearchState(
      name: "Elegant White Shirt",
      imageUrl:
          "https://www.shutterstock.com/image-photo/young-fashion-model-stylish-beige-600nw-2382157791.jpg",
      searchTod: "1.8K",
      rating: "cold"),
  SearchState(
      name: "Trendy Yellow Sweater",
      imageUrl:
          "https://www.ukmodels.co.uk/wp-content/uploads/2015/08/shutterstock_267639224.jpg",
      searchTod: "1.6K",
      rating: "Hot"),
  SearchState(
      name: "Bold Yellow Jacket",
      imageUrl:
          "https://www.shutterstock.com/image-photo/photo-brunette-cool-millennial-beard-600nw-2083093330.jpg",
      searchTod: "1.6K",
      rating: "New"),
  SearchState(
      name: "Classic Beige Outfit",
      imageUrl:
          "https://ar.lenuoyarn.com/Content/uploads/2023821066/20230130183640d7674776822d4e13a77977698f7b394b.png",
      searchTod: "1.6K",
      rating: "Popular"),
];
List<SearchState> lastSearchReady = [
  SearchState(
    name: "Electronics ",
  ),
  SearchState(
    name: "Pants ",
  ),
  SearchState(
    name: "Three Second ",
  ),
  SearchState(
    name: "Long shirt  ",
  ),
];
    //  GridView.builder(
    //                           shrinkWrap: true,
    //                           gridDelegate:
    //                               const SliverGridDelegateWithFixedCrossAxisCount(
    //                             crossAxisCount: 1, // Number of items in a row
    //                             childAspectRatio:
    //                                 0.6, // Adjust the aspect ratio as needed
    //                           ),
    //                           itemBuilder: (BuildContext context, int index) {
    //                             try {
    //                               return Card(
    //                                 child: Row(
    //                                   children: [
    //                                     CachedNetworkImage(
    //                                         imageUrl: state.imageUrl),
    //                                     Column(
    //                                       children: [
    //                                         Text(state.name),
    //                                         Text(state.searchTod),
    //                                       ], 
    //                                     ),
    //                                   ],
    //                                 ),
    //                               );
    //                             } catch (e) {
    //                               debugPrint("Error: $e");
    //                               return const SizedBox();
    //                             }
    //                           },
    //                         ),
    //                       the error in this code becuse when ignore this code the program is run 