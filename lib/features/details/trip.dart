import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Trip extends StatefulWidget {
  final Car car;
  final String label;
  final String label1;
  final IconData icon;
  const Trip({
    super.key,
    required this.car,
    required this.label,
    required this.label1,
    required this.icon,
  });

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label1,
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 225, 223, 223),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Handle date selection
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(widget.icon, color: Colors.green),
                          Text(
                            widget.label,
                            style: AppTextStyles.bodySmall(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 5,
                      children: [
                        Text(
                          'Add Dates',
                          style: AppTextStyles.headerMedium(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                        Icon(FontAwesomeIcons.angleRight, color: Colors.green),
                      ],
                    ),
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
