class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  bool isFavorite;
  final String descrption;
  final double price;
  final String category;
  final String? imgUrlCategory;
  final String review;
  final String? rating;

  ProductItemModel({
    this.imgUrlCategory,
    required this.id,
    required this.name,
    required this.imgUrl,
    this.isFavorite = false,
    this.descrption = "",
    required this.price,
    required this.category,
    required this.review,
    required this.rating,
  });
}

List<ProductItemModel> products = [
  ProductItemModel(
      id: "1",
      name: "Red Dress",
      imgUrl: "https://m.media-amazon.com/images/I/618E1D4hM6L._AC_UY1000_.jpg",
      isFavorite: false,
      descrption: "Elegant red dress perfect for evening events.",
      price: 49.99,
      category: "Clothing",
      review: "200",
      rating: "3.5"),
  ProductItemModel(
      id: "2",
      name: "Blue Jeans",
      imgUrl:
          "https://allwouldenvy.com/cdn/shop/files/allwouldenvy-awe-dresses-lexie-floral-square-neck-slit-dress-in-green-45266735071506.jpg?v=1709329400",
      isFavorite: true,
      descrption: "Comfortable blue jeans for casual wear.",
      price: 39.99,
      category: "Clothing",
      review: "145",
      rating: "3.2"),
  ProductItemModel(
      id: "3",
      name: "White Sneakers",
      imgUrl:
          "https://www.lulus.com/images/product/xlarge/10955601_2266196.jpg?w=375&hdpi=1",
      isFavorite: false,
      descrption: "Stylish white sneakers for everyday use.",
      price: 59.99,
      category: "Footwear",
      review: "40",
      rating: "3.5"),
  ProductItemModel(
      id: "4",
      name: "Black Handbag",
      imgUrl:
          "https://m.media-amazon.com/images/I/71BoMB3q-YS._AC_UF894,1000_QL80_.jpg",
      isFavorite: false,
      descrption: "Chic black handbag with plenty of space.",
      price: 79.99,
      category: "Accessories",
      review: "90",
      rating: "2.5"),
  ProductItemModel(
      id: "5",
      name: "Green T-Shirt",
      imgUrl:
          "https://m.media-amazon.com/images/I/71BoMB3q-YS._AC_UF894,1000_QL80_.jpg",
      isFavorite: true,
      descrption: "Soft green t-shirt made of organic cotton.",
      price: 19.99,
      category: "Clothing",
      review: "22",
      rating: "4.5"),
  ProductItemModel(
      id: "6",
      name: "Leather Jacket",
      imgUrl: "https://m.media-amazon.com/images/I/618E1D4hM6L._AC_UY1000_.jpg",
      isFavorite: true,
      descrption: "Cool leather jacket for a stylish look.",
      price: 129.99,
      category: "Clothing",
      review: "11",
      rating: "5"),
  ProductItemModel(
      id: "7",
      name: "Silver Watch",
      imgUrl:
          "https://m.media-amazon.com/images/I/71BoMB3q-YS._AC_UF894,1000_QL80_.jpg",
      isFavorite: false,
      descrption: "Elegant silver watch with a modern design.",
      price: 199.99,
      category: "Accessories",
      review: "5",
      rating: "4"),
  ProductItemModel(
      id: "8",
      name: "Running Shoes",
      imgUrl:
          "https://www.ohpolly.com/cdn/shop/products/5468_4_Sawyer-Ivory-Square-Neck-Long-Sleeve-Ruched-Mid-Dress.jpg?v=1663838809",
      isFavorite: true,
      descrption: "High-performance running shoes for athletes.",
      price: 89.99,
      category: "Footwear",
      review: "347",
      rating: "4.2"),
  ProductItemModel(
      id: "9",
      name: "Summer Hat",
      imgUrl:
          "https://honkytonky.in/cdn/shop/products/7133-1_53343d4f-62bc-43b5-893d-19a22743641e.jpg?v=1702756553&width=2048",
      isFavorite: false,
      descrption: "Stylish summer hat to protect you from the sun.",
      price: 25.99,
      category: "Accessories",
      review: "21",
      rating: "4.4"),
  ProductItemModel(
      id: "10",
      name: "Sports Shorts",
      imgUrl:
          "https://www.lulus.com/images/product/xlarge/10555061_2150816.jpg?w=375&hdpi=1",
      isFavorite: false,
      descrption: "Comfortable sports shorts for active wear.",
      price: 29.99,
      category: "Clothing",
      review: "66",
      rating: "4.6"),
];

void ttt() {
  Set<String> uniqueCategories = {};
  List<Map<String, String>> category = [];

  products.forEach((product) {
    if (uniqueCategories.add(product.category)) {
      category.add({"imgurlcate": "", "category": product.category});
    }
  });

  print(category);
  print(category.length);
}
