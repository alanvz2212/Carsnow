import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsnow/features/details/cancel.dart';
import 'package:carsnow/features/details/car_basics.dart';
import 'package:carsnow/features/details/car_features.dart';
import 'package:carsnow/features/details/dec.dart';
import 'package:carsnow/features/details/guidelines.dart';
import 'package:carsnow/features/details/host.dart';
import 'package:carsnow/features/details/trip.dart';
import 'package:carsnow/features/details/rating.dart';
import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/screens/select_trip.dart';
import 'package:carsnow/widgets/b_sheet.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Details extends StatefulWidget {
  final Car car;
  const Details({super.key, required this.car});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              // Carousel Section
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 250.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: widget.car.images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _current,
                      count: widget.car.images.length,
                      effect: WormEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                        activeDotColor: Colors.green,
                        dotColor: Colors.grey.shade300,
                      ),
                      onDotClicked: (index) {
                        _controller.jumpToPage(index);
                      },
                    ),
                  ),
                ],
              ),

              // Car Name and Pricing
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.car.name,
                      style: AppTextStyles.headerBold(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'AED ${(widget.car.pricing.daily / 24).toStringAsFixed(2)}/hour',
                      style: AppTextStyles.headerBold(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              // Rating and Trips
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color.fromARGB(255, 80, 201, 86),
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${widget.car.ratings.first.score}',
                      style: AppTextStyles.bodySmall(color: Colors.grey),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.circle, color: Colors.grey, size: 5),
                    SizedBox(width: 2),
                    Text(
                      '5 trips',
                      style: AppTextStyles.bodySmall(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Rest of the existing sections (Pricing, Host, Trip Dates, etc.)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Pricing',
                  style: AppTextStyles.headerMedium(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPricingColumn(
                      'Daily',
                      'AED ${widget.car.pricing.daily}',
                    ),
                    Container(
                      width: 2,
                      height: 50,
                      color: const Color.fromARGB(255, 89, 81, 81),
                    ),
                    _buildPricingColumn(
                      'Weekly',
                      'AED ${widget.car.pricing.weekly}',
                    ),
                    Container(
                      width: 2,
                      height: 50,
                      color: const Color.fromARGB(255, 89, 81, 81),
                    ),
                    _buildPricingColumn(
                      'Monthly',
                      'AED ${widget.car.pricing.monthly}',
                    ),
                  ],
                ),
              ),
              HostSection(car: widget.car),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (ctx) => SelectTrip()));
                },
                child: Trip(
                  label1: 'Trip Dates',
                  icon: Icons.calendar_month,
                  car: widget.car,
                  label: 'Any Time',
                ),
              ),
              SizedBox(height: 16),
              DescriptionSection(car: widget.car),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        CarTestDriveBottomSheet(selectedCar: widget.car),
                  );
                },
                child: Trip(
                  label1: 'Test Drive',
                  icon: Icons.car_rental,
                  car: widget.car,
                  label: 'Test drive your Dream Car',
                ),
              ),
              SizedBox(height: 16),
              CarBasicsSection(car: widget.car),
              SizedBox(height: 16),
              CarFeaturesSection(car: widget.car),
              SizedBox(height: 16),
              CancellationPolicySection(car: widget.car),
              SizedBox(height: 16),
              RatingAndReviewsSection(),
              SizedBox(height: 16),
              GuidelinesSection(),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPricingColumn(String title, String price) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.headerMedium(color: Colors.black, fontSize: 15),
        ),
        SizedBox(height: 5),
        Text(
          price,
          style: AppTextStyles.headerBold(color: Colors.black, fontSize: 13),
        ),
      ],
    );
  }
}
