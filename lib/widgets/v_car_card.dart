import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/screens/details.dart';
import 'package:carsnow/widgets/button.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class VCarCard extends StatelessWidget {
  final Car car;
  final String name;
  final double rating;
  final int seats;
  final String price;
  final String imagePath;
  const VCarCard({
    super.key,
    required this.car,
    required this.name,
    required this.rating,
    required this.seats,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:
            MediaQuery.of(context).size.width * 0.7, // Use 90% of screen width
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: MediaQuery.of(context).size.width * 1,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: AppTextStyles.headerBold(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        price,
                        style: AppTextStyles.headerBold(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 80, 201, 86),
                                size: 16,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                rating.toStringAsFixed(1),
                                style: AppTextStyles.bodySmall(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.circle, color: Colors.grey, size: 5),
                              SizedBox(width: 2),
                              Text(
                                '5 trips',
                                style: AppTextStyles.bodySmall(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Available from 2 August',
                            style: AppTextStyles.headerMedium(fontSize: 14),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 9),
                        child: CustomButton(
                          text: 'Details',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => Details(car: car),
                              ),
                            );
                          },
                          width: 95,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
