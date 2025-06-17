import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CancellationPolicySection extends StatelessWidget {
  final Car car;

  const CancellationPolicySection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cancellation Policy',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 214, 211, 211),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 5,
                children: [
                  Icon(Icons.thumb_up, color: Colors.green),
                  Text(
                    'Free Cancellation: If you cancel your booking\n before 48 hrs of your trip',
                    maxLines: 2,
                    style: AppTextStyles.bodySmall(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
