import 'package:ecommerce_app/views/pages/category_tab_view.dart';
import 'package:ecommerce_app/views/pages/home_tap_view.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:ecommerce_app/views/pages/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://t3.ftcdn.net/jpg/03/02/88/46/360_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, momen",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "Let's go shopping",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.search, size: 30),
                              onPressed: () {
                                try {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchBarApp(), // تأكد من أن SearchBarApp هو Widget صالح
                                    ),
                                  );
                                } catch (e) {
                                  print(
                                      'Error: $e'); // طباعة أي خطأ يتم التقاطه
                                }
                              },
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              icon: const Icon(
                                  Icons.notifications_none_outlined,
                                  size: 30),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsPage(), // تأكد من أن SearchBarApp هو Widget صالح
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: "Home "),
                      Tab(text: "Category"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HomeTap(),
                  GategoryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
