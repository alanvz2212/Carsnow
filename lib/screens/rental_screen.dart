import 'package:carsnow/data/brand.dart';
import 'package:carsnow/widgets/brand_list.dart';
import 'package:carsnow/widgets/chip.dart';
import 'package:carsnow/widgets/custom_appbar.dart';
import 'package:carsnow/widgets/horizontal_list.dart';
import 'package:carsnow/widgets/section_header.dart';
import 'package:carsnow/widgets/vertical_list.dart';
import 'package:flutter/material.dart';

class RentalScreen extends StatefulWidget {
  const RentalScreen({super.key});

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 8.0, left: 8),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FilterOptionsChips(),
              ),
              SectionHeader(title: 'Top Rented Cars'),
              HorizontalCardList(),
              BrandSection(brands: brands),
              SectionHeader(title: 'Most Popular Cars'),
              VerticalList(),
            ],
          ),
        ),
      ),
    );
  }
}
