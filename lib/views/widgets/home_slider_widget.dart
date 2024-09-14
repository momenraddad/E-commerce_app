import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/home_slider_model.dart';
import 'package:flutter/material.dart';

class HomeSliderWidget extends StatefulWidget {
  final List<HomeSliderModel> imageList;

  const HomeSliderWidget({super.key, required this.imageList});

  @override
  State<HomeSliderWidget> createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            viewportFraction: 1,
            padEnds: false,
            disableCenter: true,
            // autoPlay: true,
            // autoPlayInterval:
            //     const Duration(milliseconds: 700),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: widget.imageList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.imageList[itemIndex].imgUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error),
                    Text(" error , cannot display the image ")
                  ],
                ),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(entry.key),
              child: Container(
                width: 6,
                height: 6,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
