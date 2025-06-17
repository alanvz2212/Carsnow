import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CarFeaturesSection extends StatelessWidget {
  final Car car;
  final Map<String, IconData> featureIcons = {
    'Air Conditioning': Icons.ac_unit,
    'Bluetooth': Icons.bluetooth,
    'Sunroof': Icons.sunny,
    'GPS': Icons.location_on,
    'Leather Seats': Icons.event_seat,
    'Heated Seats': Icons.thermostat,
  };

  CarFeaturesSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Column(
        children: [
          Text(
            'Car Features',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 80, // Set the height of the container (square)
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: car.features.length,
              itemBuilder: (context, index) {
                String feature = car.features[index];
                // Get the corresponding icon for the feature
                IconData? icon = featureIcons[feature];

                return Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ), // Padding between chips
                  child: icon != null
                      ? Container(
                          width: 70, // Set fixed width (square size)
                          height: 70, // Set fixed height (square size)
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 222, 222),
                            borderRadius: BorderRadius.circular(
                              16,
                            ), // Circular corners
                          ),
                          child: Center(
                            // Center the icon inside the square
                            child: Icon(
                              icon,
                              color: const Color.fromARGB(255, 78, 75, 75),
                              size: 35, // Set the size of the icon
                            ),
                          ),
                        )
                      : Container(), // If no icon is found, don't display anything
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
