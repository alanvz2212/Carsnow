import 'package:carsnow/screens/login_screen.dart';
import 'package:carsnow/screens/rental_screen.dart';
import 'package:carsnow/widgets/brand_image.dart';
import 'package:carsnow/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    if (context.mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: AnimationLimiter(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 1.0, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 900),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                // Banner
                BrandImage(),
                const SizedBox(height: 16),

                // Explore Categories
                const SectionHeader(title: "Explore Categories"),
                const SizedBox(height: 8),
                Column(
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => RentalScreen(),
                          ),
                        );
                      },
                      child: CategoryCard(
                        title: "Rentals",
                        subtitle: "Book Your Dream Car At Your Budget",
                        imagePath: 'assets/Images/rentals.jpg',
                      ),
                    ),
                    CategoryCard(
                      title: "Lease To Own",
                      subtitle: "Own Your Car With Easy Payment Plans",
                      imagePath: 'assets/Images/lease.jpg',
                    ),
                    CategoryCard(
                      title: "Booking Service",
                      subtitle: "Book Your Service At Your Own Time",
                      imagePath: 'assets/Images/booking_service.jpg',
                    ),
                    CategoryCard(
                      title: "Service Contract",
                      subtitle: "Subscribe Your Car Services",
                      imagePath: 'assets/Images/service_contract.jpg',
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Budget Rental Cars
                const SectionHeader(title: "Budget Rental Cars"),
                const SizedBox(height: 8),
                HorizontalCarList(),

                const SizedBox(height: 16),

                // Top Brands
                const SizedBox(height: 8),
                BrandSection(brands: brands),

                const SizedBox(height: 8),
                const SectionHeader(title: "Budget Rental Cars"),
                const SizedBox(height: 8),
                HorizontalCarList(),
                const SizedBox(height: 8),
                const SectionHeader(title: "Budget Rental Cars"),
                const SizedBox(height: 8),
                HorizontalCarList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
