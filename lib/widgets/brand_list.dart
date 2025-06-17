import 'package:carsnow/model/brand_model.dart';
import 'package:carsnow/widgets/brand_card.dart';
import 'package:carsnow/widgets/section_header.dart';
import 'package:flutter/material.dart';

class BrandSection extends StatelessWidget {
  final List<Brand> brands;
  final String title;
  const BrandSection({
    Key? key,
    required this.brands,
    this.title = "Top Brands",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: brands.map((brand) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BrandCard(brandName: brand.name, logoPath: brand.logo),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
