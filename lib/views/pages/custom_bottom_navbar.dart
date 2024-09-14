import 'package:ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<Widget> _buildscreens() {
    return [
      BlocProvider(
        create: (context) {
          final cubit = HomeCubit();
          cubit.getHomeDate();
          return cubit;
        },
        child: const HomePage(),
      ),
      const CartPage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];
  }

  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: [
        PersistentTabConfig(
          screen: _buildscreens()[0],
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: _buildscreens()[1],
          item: ItemConfig(
            icon: const Icon(Icons.shopping_cart),
            title: " cart",
          ),
        ),
        PersistentTabConfig(
          screen: _buildscreens()[2],
          item: ItemConfig(
            icon: const Icon(Icons.favorite),
            title: " Favorite",
          ),
        ),
        PersistentTabConfig(
          screen: _buildscreens()[3],
          item: ItemConfig(
            icon: const Icon(Icons.person_rounded),
            title: "Profile",
          ),
        )
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
