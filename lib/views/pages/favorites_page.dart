import "package:flutter/material.dart";

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: const Scaffold(
            body: Center(child: Text("i am in FavoritesPage "))));
  }
}
