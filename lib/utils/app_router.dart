import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/views/pages/category_details.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:ecommerce_app/views/pages/search_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRooute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.prouductDetails:
        return MaterialPageRoute(
            builder: (_) => const ProductDetailsPage(), settings: settings);
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => const SearchBarApp());
      case AppRoutes.categoryDetails:
        return MaterialPageRoute(
          builder: (_) => const CategoryDetails(),
        );
      case AppRoutes.home:
      default:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavbar());
    }
  }
}
