import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/category_item.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/view_models/category_cubit/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GategoryPage extends StatelessWidget {
  const GategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        final cubit = CategoryCubit();
        cubit.getCategory();

        return cubit;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              // height: 400,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                // bloc: BlocProvider.of<CategoryCubit>(context),
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (state is CategoryError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is CategoryLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // Number of items in a row
                          // crossAxisSpacing: 5,
                          mainAxisSpacing: 6,
                          childAspectRatio:
                              3, // Adjust the aspect ratio as needed
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          CategoryItem category = state.categoryList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.categoryDetails);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Card(
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      width: size.width,
                                      imageUrl: category.imgUrl,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: category.category == "Bags"
                                          ? null
                                          : (index % 2 == 0 ? 20 : 180),
                                      right: category.category == "Bags"
                                          ? 12
                                          : null,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        // استخدام Column لاحتواء أكثر من عنصر
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // تنظيم العناصر داخل الـ Column
                                        children: [
                                          Text(
                                            category.category,
                                            style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            category.amountProduct +
                                                "products", // يمكنك تعديل النص هنا إذا أردت
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: categoryList.length,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(" nothing"),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
