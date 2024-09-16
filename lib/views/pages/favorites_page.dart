import "package:ecommerce_app/utils/app_routes.dart";
import "package:ecommerce_app/view_models/home_cubit/home_cubit.dart";
import "package:ecommerce_app/views/widgets/product_item.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class FilterButtonsSeparated extends StatefulWidget {
  @override
  State<FilterButtonsSeparated> createState() => _FilterButtonsSeparatedState();
}

class _FilterButtonsSeparatedState extends State<FilterButtonsSeparated> {
  int selectedIndex = 0;
  final List<String> filterOptions = [
    'All',
    'Latest',
    'Most Popular',
    'Cheapest'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(filterOptions.length, (index) {
        return Container(
          margin: const EdgeInsets.only(right: 5, top: 20),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(
                  color: selectedIndex == index ? Colors.purple : Colors.grey),
              backgroundColor:
                  selectedIndex == index ? Colors.purple : Colors.white,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Text(
              filterOptions[index],
              style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.grey),
            ),
          ),
        );
      })),
    );
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(body: Center(child: FilterButtonsSeparated()))));
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.favoritesP();
        return cubit;
      },
      child: SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.only(top: 20),
                width: size.width,
                child: Row(
                  children: [
                    SearchAnchor(
                      viewElevation: 0,
                      viewShape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SizedBox(
                          width: size.width * 0.88,
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
                          return ListTile(title: Text(item), onTap: () {});
                        });
                      },
                    ),
                  ],
                ),
              ),
              FilterButtonsSeparated(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is FavoritesLoaded) {
                    if (state.productsF.isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: state.productsF.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(
                                AppRoutes.prouductDetails,
                                arguments: state.productsF[index].id,
                              );
                            },
                            child: ProductItem(
                                products: state.productsF[index],
                                index: state.productsF[index].id,
                                state: state),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("No data"),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text("No data"),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ))),
    );
  }
}
