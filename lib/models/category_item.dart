class CategoryItem {
  final String category;
  final String imgUrl;
  final String amountProduct;

  CategoryItem(
      {required this.category,
      required this.imgUrl,
      required this.amountProduct});
}

List<CategoryItem> categoryList = [
  CategoryItem(
      category: "Clothing",
      imgUrl:
          "https://static.vecteezy.com/system/resources/previews/036/544/423/non_2x/joyous-young-attractive-girlfriends-dressed-in-casual-clothes-showing-on-each-other-with-index-fingers-and-looking-cheerfully-at-camera-with-wide-smiles-isolated-over-grey-background-photo.jpg",
      amountProduct: "10"),
  CategoryItem(
      category: "Accessories",
      imgUrl:
          "https://cdn.prod.website-files.com/640f458dd5273909c574c3bb/650a7607083d682d9f42ada2_photo-1569388330292-79cc1ec67270.jpg",
      amountProduct: "9"),
  CategoryItem(
      category: "Footwear",
      imgUrl:
          "https://thumbs.dreamstime.com/b/side-view-black-white-sports-shoes-one-sneaker-gray-background-copy-space-ai-generated-modern-outdoor-activities-269680415.jpg",
      amountProduct: "20"),
  CategoryItem(
      category: "Bags",
      imgUrl:
          "https://makeurdaysfresh.wordpress.com/wp-content/uploads/2015/01/model-girl-with-bag-hd-wide-wallpaper-1920x1080.jpg",
      amountProduct: "30"),
  CategoryItem(
      category: "Electronics",
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWFM9ptcftBKh0gzpu4gL3KYIQGZFVKxgBJyKMnas9YgUL2Gulyk4OPwDUMz_NoW--hww&usqp=CAU",
      amountProduct: "25"),
];
