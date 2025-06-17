import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HostSection extends StatelessWidget {
  final Car car;
  const HostSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Host',
            style: AppTextStyles.headerMedium(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(car.host.profileImage),
                    radius: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: const Color.fromARGB(255, 80, 201, 86),
                        size: 14,
                      ),
                      SizedBox(width: 2),
                      Text(
                        car.host.rating.toStringAsFixed(1),
                        style: AppTextStyles.bodySmall(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.host.name,
                      style: AppTextStyles.headerMedium(color: Colors.black),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.ribbon,
                          color: Colors.orange,
                          size: 14,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'All Star Host',
                          style: AppTextStyles.bodySmall(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '5 trips',
                          style: AppTextStyles.bodySmall(color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.circle, color: Colors.black, size: 5),
                        SizedBox(width: 5),
                        Text(
                          'Joined Sep 2020',
                          style: AppTextStyles.bodySmall(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.timer, color: Colors.grey, size: 14),
                        SizedBox(width: 2),
                        Text(
                          car.host.responseTime,
                          style: AppTextStyles.bodySmall(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.phone, color: Colors.green),
              SizedBox(width: 8),
              Icon(Icons.chat, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
