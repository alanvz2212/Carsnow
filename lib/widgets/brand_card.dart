import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final String brandName;
  final String logoPath;
  final double imageSize;

  const BrandCard({
    Key? key,
    required this.brandName,
    required this.logoPath,
    this.imageSize = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: imageSize + 20, // Adjust based on image size for padding
          height: imageSize + 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
            border: Border.all(
              color: Colors.black38,
            ), // Background color of the circle
          ),
          child: ClipOval(
            child: Image.asset(
              logoPath,
              width: imageSize, // Adjusted image width
              height: imageSize, // Adjusted image height
              fit: BoxFit.cover, // Ensures the image scales properly
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          brandName,
          style: AppTextStyles.headerMedium(color: Colors.black, fontSize: 13),
        ),
      ],
    );
  }
}
