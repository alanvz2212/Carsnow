import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/button.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CarTestDriveBottomSheet extends StatelessWidget {
  final Car selectedCar;
  const CarTestDriveBottomSheet({super.key, required this.selectedCar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book Test Drive',
            style: AppTextStyles.headerBold(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(selectedCar.images.first),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            selectedCar.name,
            style: AppTextStyles.headerBold(color: Colors.black, fontSize: 22),
          ),
          SizedBox(height: 4.0),
          Text(
            'Book Your test Drive for this Car!',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 16.0),
          _buildTestDriveItem(
            Icons.home,
            "Home Test Drive",
            'Available in Dubai, Sharjah & Ajman',
          ),
          SizedBox(height: 16.0),
          _buildTestDriveItem(
            Icons.car_repair,
            'Free hub test drive',
            'Available at Lagos, Abuja',
          ),
          SizedBox(height: 16.0),
          CustomButton(text: 'Book Now', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildTestDriveItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
