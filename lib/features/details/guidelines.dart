import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class GuidelinesSection extends StatelessWidget {
  const GuidelinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Guidelines',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          BulletPoint(
            text:
                'NO PETS AND NO SMOKING are Strictly Enforced with this rental.',
          ),
          BulletPoint(
            text:
                'If you are a smoker, you must wait min. 4-6 hours and intend to smoke recreationally. Highly recommend you not rent this vehicle.',
          ),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: AppTextStyles.bodySmall(color: Colors.grey)),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodySmall(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
