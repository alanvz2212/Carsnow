import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class RatingAndReviewsSection extends StatelessWidget {
  const RatingAndReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(
            'Ratings',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text('5.00', style: AppTextStyles.headerBold(color: Colors.black)),
          Text(
            '(4 ratings)',
            style: AppTextStyles.bodySmall(color: Colors.black),
          ),
          SizedBox(height: 16.0),
          _buildProgressBar('Cleanliness', 4.9),
          _buildProgressBar('Maintenance', 5.0),
          _buildProgressBar('Communication', 4.9),
          _buildProgressBar('Listing accuracy', 5.0),
        ],
      ),
    );
  }

  Widget _buildProgressBar(String title, double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: AppTextStyles.bodySmall(color: Colors.black),
            ),
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: value / 5.0,
              backgroundColor: Colors.grey[200],
              color: Colors.green,
              minHeight: 6,
            ),
          ),
          SizedBox(width: 16.0),
          Text('$value', style: AppTextStyles.bodySmall(color: Colors.black)),
        ],
      ),
    );
  }
}
