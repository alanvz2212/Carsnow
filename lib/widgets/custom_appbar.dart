import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  CustomAppbar({Key? key})
    : preferredSize = const Size.fromHeight(150),
      super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Column(
        children: [
          // First Row with Location, Dropdown, and Images
          AppBar(
            backgroundColor: const Color(0xFF3b0578),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side - Location and Icon
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      "Location",
                      style: AppTextStyles.bodyRegular(color: Colors.white),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),

                Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      width: 75,
                      height: 45,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/Images/cars.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/Images/booking_service.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Second Row with Search Bar
          Container(
            color: const Color(0xFF3b0578),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Search Bar
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, size: 35),
                      hintText: "Search any car...",
                      hintStyle: AppTextStyles.bodySmall(),
                      suffixIcon: const Icon(Icons.filter_list),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
