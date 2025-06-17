import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsnow/data/car.dart';
import 'package:flutter/material.dart';

class BrandImage extends StatelessWidget {
  const BrandImage({super.key});

  @override
  Widget build(BuildContext context) {
    final brandImages = carData.map((car) => car.images.first).toSet().toList();

    return CarouselSlider(
      options: CarouselOptions(
        height: 100,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enlargeCenterPage: false,
      ),
      items: brandImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
