import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final Car car;
  const DescriptionSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            car.description,
            style: AppTextStyles.bodySmall(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
