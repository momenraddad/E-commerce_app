import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {super.key,
      required this.products,
      required this.index,
      required this.state});
  final ProductItemModel products;
  final String index;
  final HomeState state;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Stack(alignment: AlignmentDirectional.topEnd, children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)),
              child: Image.network(
                widget.products.imgUrl,
                height: 195,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(50)),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    context
                        .read<HomeCubit>()
                        .changedState(state, widget.index as String);

                    print("changed state iam in  ${state}");
                    print("changed widget.state iam in  ${widget.state}");

                    if (state == widget.state) {
                      final product = context
                          .read<HomeCubit>()
                          .getProductById(widget.index);
                      print("changed state iam in  if  ${state}");

                      return IconButton(
                        onPressed: () {
                          product.isFavorite = !product.isFavorite;

                          print("${product.id} : ${product.isFavorite}");
                          context
                              .read<HomeCubit>()
                              .changedState(state, widget.index);
                        },
                        icon: product.isFavorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                      );
                    } else {
                      print("changed state iam in else  ${state}");
                      print("changed widget.state iam in else ${widget.state}");
                      return Center(
                        child: Text("data"),
                      );
                    }
                  },
                ),
              ),
            )
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.products.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.products.category,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${widget.products.price}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
