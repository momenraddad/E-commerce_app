import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/view_models/Counter_cubit/cubit/counter_cubit.dart';
import 'package:ecommerce_app/view_models/Size_cubit/cubit/size_cubit.dart';
import 'package:ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;
  final Function onSelect;

  SizeOption(
      {required this.size, required this.isSelected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(size);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8, top: 4),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
            color: isSelected ? Colors.grey : Colors.transparent,
            border: Border.all(color: Colors.grey),
            shape: BoxShape.circle),
        child: Text(
          size,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = HomeCubit();
            cubit.getProductById(index);
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => SizeCubit(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            final product = state.products[index];
            bool favorite = product.isFavorite;
            return SafeArea(
              child: Scaffold(
                body: SizedBox.expand(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: size.height * 0.55,
                        width: size.width,
                        imageUrl: product.imgUrl,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 50,
                        child: AppBar(
                          elevation: 1,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 170),
                          centerTitle: true,
                          title: const Text("Detail Product",
                              style: TextStyle(fontWeight: FontWeight.w900)),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  print("before:");
                                  print(product.isFavorite);
                                  print("value of :");

                                  print(state.products[index].isFavorite);
                                  product.isFavorite = !product.isFavorite;
                                  favorite = product.isFavorite;
                                  print(product.isFavorite);
                                  context.read<HomeCubit>().changedState();
                                },
                                icon: Icon(product.isFavorite == false
                                    ? Icons.favorite_outline
                                    : Icons.favorite))
                          ],
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.40,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(43),
                              topRight: Radius.circular(43),
                            ),
                          ),
                          height: size.height * 0.65,
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 28, left: 28, top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              158, 158, 158, 220),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 4),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<CounterCubit>()
                                                      .decrement();
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                            BlocBuilder<CounterCubit, int>(
                                              builder: (context, count) {
                                                return Text(
                                                  '$count',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                );
                                              },
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 4),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<CounterCubit>()
                                                      .increment();
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 16,
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFFEBB0C),
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      product.rating ?? "",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "(${product.review} Review) ",
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Avaliable in stok",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Size",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                BlocBuilder<SizeCubit, String>(
                                  builder: (context, selectedSize) {
                                    final contex = context.read<SizeCubit>();

                                    return Row(
                                      children: [
                                        SizeOption(
                                          size: "S",
                                          isSelected: selectedSize == "S",
                                          onSelect: (size) {
                                            contex.selectSize(size);
                                          },
                                        ),
                                        SizeOption(
                                          size: "M",
                                          isSelected: selectedSize == "M",
                                          onSelect: (size) {
                                            contex.selectSize(size);
                                          },
                                        ),
                                        SizeOption(
                                          size: "L",
                                          isSelected: selectedSize == "L",
                                          onSelect: (size) {
                                            contex.selectSize(size);
                                          },
                                        ),
                                        SizeOption(
                                          size: "XL",
                                          isSelected: selectedSize == "XL",
                                          onSelect: (size) {
                                            contex.selectSize(size);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(product.descrption),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text(
                                      "\$",
                                      style: TextStyle(
                                          color: Color(0xFF514EB5),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Text(
                                      product.price.toStringAsFixed(2),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: const Color(0xFF514EB7),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: const InkWell(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_bag,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "  Add to Cart",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.1,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("No product found"));
          }
        },
      ),
    );
  }
}
