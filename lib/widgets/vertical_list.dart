import 'package:carsnow/data/car.dart';
import 'package:carsnow/widgets/v_car_card.dart';
import 'package:flutter/material.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: carData.length * 2, // Double the item count
      itemBuilder: (context, index) {
        final car = carData[
            index % carData.length]; // Use modulo to cycle through the list
        return VCarCard(
          car: car,
          name: car.name,
          rating: car.ratings.first.score,
          seats: car.basics.seatingCapacity,
          price: 'AED ${car.pricing.daily.toStringAsFixed(2)}/day',
          imagePath: car.images.first,
        );
      },
    );
  }
}
