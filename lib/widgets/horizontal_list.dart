import 'package:carsnow/data/car.dart';
import 'package:carsnow/screens/details.dart';
import 'package:carsnow/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HorizontalCardList extends StatelessWidget {
  const HorizontalCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: carData.length * 2, // Double the item count
          itemBuilder: (context, index) {
            final car =
                carData[index %
                    carData.length]; // Use modulo to cycle through the list
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 800),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => Details(car: car),
                          ),
                        );
                      },
                      child: CarCard(
                        name: car.name,
                        rating: car.ratings.first.score,
                        seats: car.basics.seatingCapacity,
                        price: '\$${car.pricing.daily.toStringAsFixed(2)}/day',
                        imagePath: car.images.first,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
