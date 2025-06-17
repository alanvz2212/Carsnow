import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CarBasicsSection extends StatelessWidget {
  final Car car;
  const CarBasicsSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Basics',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCarBasicsItem(
                  icon: Icons.battery_charging_full_sharp,
                  label: car.basics.batteryCapacity,
                  text: 'Battery Capacity',
                ),
                SizedBox(width: 16),
                _buildCarBasicsItem(
                  icon: Icons.chair,
                  label: '${car.basics.seatingCapacity} Seats',
                  text: 'Capacity',
                ),
                SizedBox(width: 16),
                _buildCarBasicsItem(
                  icon: Icons.door_front_door,
                  label: '${car.basics.doors} Doors',
                  text: 'Entrance',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarBasicsItem({
    required IconData icon,
    required String label,
    required String text,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 228, 228, 228)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Icon(icon, color: Colors.green, size: 25),
            SizedBox(width: 4),
            Text(text, style: AppTextStyles.bodySmall(color: Colors.grey)),
            Text(label, style: AppTextStyles.headerBold(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
