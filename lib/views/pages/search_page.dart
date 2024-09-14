import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Flutter code sample for [SearchBar].

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        final cubit = SearchCubit();
        cubit.getData();
        return cubit;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, right: 10),
                width: size.width,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    SearchAnchor(
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SizedBox(
                          width: size.width * 0.82,
                          child: SearchBar(
                            controller: controller,
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                          ),
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchResult) {
                      if (state.PopularSearch!.isEmpty) {
                        return const Center(
                          child: Text("No data"),
                        );
                      }
                      for (var product in state.PopularSearch!) {
                        debugPrint(
                            'Name: ${product.name}, ImageUrl: ${product.imageUrl}, Rating: ${product.rating}, Search Today: ${product.searchTod}');
                      }
                      debugPrint("state.product.toString()  ");
                      debugPrint(state.PopularSearch.toString());
                      debugPrint("Last Search Data: ${state.lastSearch}");
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Last Search",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800),
                              ),
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<SearchCubit>(context)
                                      .remove("ClearALL");
                                },
                                child: const Text(
                                  "Clear All",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.all(1),
                            width: size.width *
                                0.9, // Adjust this to give more space
                            child: state.lastSearch != null &&
                                    state.lastSearch!.isNotEmpty
                                ? Wrap(
                                    spacing: 14,
                                    runSpacing: 12,
                                    children: state.lastSearch!.map((item) {
                                      return Container(
                                        constraints: BoxConstraints(
                                          maxWidth: size.width *
                                              0.5, // Allow more space for text to wrap
                                        ),
                                        child: Chip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          deleteIcon: const Icon(
                                            color: Colors.grey,
                                            Icons.cancel_rounded,
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          label: Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Color(0xffB4B6BC),
                                            ),
                                            overflow: TextOverflow
                                                .visible, // Ensure the text wraps
                                            softWrap: true, // Enable wrapping
                                          ),
                                          onDeleted: () {
                                            BlocProvider.of<SearchCubit>(
                                                    context)
                                                .remove(item);
                                          },
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : const Center(
                                    child: Text(
                                        "No search history")), // Display a fallback if no last search
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    " Popular Search ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: (size.height * 0.146) *
                                    (state.PopularSearch!.length),
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: state.PopularSearch!.length,
                                  // itemCount: 4,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisCount:
                                        1, // Number of items in a row
                                    // crossAxisSpacing: 5,
                                    // mainAxisSpacing: 10.0,
                                    childAspectRatio:
                                        3.8, // Adjust the aspect ratio as needed
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final product = state.PopularSearch![index];
                                    Color backgroundColor;
                                    Color textColor;
                                    final status = product.rating;

                                    // تحديد اللون بناءً على الحالة
                                    if (status == "Hot") {
                                      backgroundColor =
                                          Colors.red.withOpacity(0.2);
                                      textColor = Colors.red;
                                    } else if (status == "New") {
                                      backgroundColor =
                                          Colors.orange.withOpacity(0.2);
                                      textColor = Colors.orange;
                                    } else if (status == "Popular") {
                                      backgroundColor =
                                          Colors.green.withOpacity(0.2);
                                      textColor = Colors.green;
                                    } else {
                                      backgroundColor =
                                          Colors.grey.withOpacity(0.2);
                                      textColor = Colors.grey;
                                    }

                                    debugPrint(
                                        state.PopularSearch!.length.toString());

                                    return Card(
                                      // color: Color.fromRGBO(254, 247, 255, 1),
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              width: size.width * 0.21,
                                              height: size.height * 0.12,
                                              imageUrl: product.imageUrl,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                product.searchTod +
                                                    " Search  today ",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: backgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              status,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          )

                          //   Expanded(
                          //     child: GridView.builder(
                          //       itemCount: state.product?.length,
                          //       gridDelegate:
                          //           const SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 2,
                          //         childAspectRatio: 0.6,
                          //       ),
                          //       itemBuilder: (BuildContext context, int index) {
                          //         return Card(
                          //           child: Row(
                          //             children: [
                          //               CachedNetworkImage(
                          //                 height: 100,
                          //                 width: 100,
                          //                 imageUrl: state
                          //                         .product?[index].imageUrl ??
                          //                     '', // Provide a valid image URL or fallback
                          //               ),
                          //               Column(
                          //                 children: [
                          //                   Text(state.product?[index].name ??
                          //                       'No Name'),
                          //                   Text(state.product?[index].searchTod ??
                          //                       'No Info'),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          //
                        ],
                      );
                    } else {
                      return const Center(child: Text("No data"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
