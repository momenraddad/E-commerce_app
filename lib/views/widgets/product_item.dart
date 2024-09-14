import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.products});
  final ProductItemModel products;

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
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.products.isFavorite =
                            !widget.products.isFavorite;
                        print(
                            "   ${widget.products.id} :${widget.products.isFavorite} ");
                      });
                    },
                    icon: widget.products.isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border)),
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
