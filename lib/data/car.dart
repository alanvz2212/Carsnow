import 'package:carsnow/model/car_basics.dart';
import 'package:carsnow/model/car_model.dart';
import 'package:carsnow/model/host_model.dart';
import 'package:carsnow/model/pricing_model.dart';
import 'package:carsnow/model/rating_model.dart';
import 'package:carsnow/model/review_model.dart';

final List<Car> carData = [
  // Tesla Cars
  Car(
    id: 'tesla_1',
    name: 'Tesla Model S',
    brandId: '1',
    images: [
      'assets/Images/tesla/t1.jpg',
      'assets/Images/tesla/t2.jpg',
      'assets/Images/tesla/t3.jpg',
    ],
    pricing: Pricing(daily: 250.0, weekly: 1500.0, monthly: 5000.0),
    host: Host(
      name: 'Tesla Enthusiast',
      profileImage: 'assets/Images/lease.jpg',
      rating: 4.8,
      responseTime: 'Within 1 hour',
    ),
    location: 'San Francisco, CA',
    description: 'High-performance electric sedan with cutting-edge technology',
    basics: CarBasics(batteryCapacity: '100 kWh', seatingCapacity: 5, doors: 4),
    features: [
      'Air Conditioning',
      'Bluetooth',
      'Sunroof',
      'GPS',
      'Leather Seats',
      'Heated Seats',
    ],
    insuranceDetails: 'Comprehensive Coverage',
    cancellationPolicy: 'Full Refund 48 Hours Prior',
    reviews: [
      Review(
        reviewerName: 'John D.',
        profileImage: 'assets/Images/lease.jpg',
        date: '2023-06-15',
        content: 'Amazing car, smooth ride and incredible acceleration!',
        rating: 5.0,
      ),
    ],
    ratings: [
      Rating(category: 'Performance', score: 4.9),
      Rating(category: 'Comfort', score: 4.7),
    ],
  ),

  // bmw Cars
  Car(
    id: 'bmw_1',
    name: 'BMW i4',
    brandId: '2',
    images: [
      'assets/Images/bmw/bm1.jpg',
      'assets/Images/bmw/bm2.jpg',
      'assets/Images/bmw/bm3.jpg',
    ],
    pricing: Pricing(daily: 200.0, weekly: 1200.0, monthly: 4500.0),
    host: Host(
      name: 'BMW Lover',
      profileImage: 'assets/Images/lease.jpg',
      rating: 4.6,
      responseTime: 'Within 2 hours',
    ),
    location: 'Munich, Germany',
    description: 'Luxury electric gran coupe with sporty performance',
    basics: CarBasics(batteryCapacity: '80 kWh', seatingCapacity: 4, doors: 4),
    features: [
      'Air Conditioning',
      'Bluetooth',
      'Sunroof',
      'GPS',
      'Leather Seats',
      'Heated Seats',
    ],
    insuranceDetails: 'Full Coverage',
    cancellationPolicy: 'Partial Refund 24 Hours Prior',
    reviews: [
      Review(
        reviewerName: 'Sarah M.',
        profileImage: 'assets/Images/lease.jpg',
        date: '2023-07-20',
        content: 'Elegant design and impressive electric range!',
        rating: 4.5,
      ),
    ],
    ratings: [
      Rating(category: 'Design', score: 4.8),
      Rating(category: 'Technology', score: 4.6),
    ],
  ),

  // Mercedes Cars
  Car(
    id: 'mercedes_1',
    name: 'Mercedes EQS',
    brandId: '5',
    images: [
      'assets/Images/mercedes/b1.jpg',
      'assets/Images/mercedes//b2.jpg',
      'assets/Images/mercedes/b3.jpg',
    ],
    pricing: Pricing(daily: 350.0, weekly: 2000.0, monthly: 6000.0),
    host: Host(
      name: 'Luxury Car Expert',
      profileImage: 'assets/Images/lease.jpg',
      rating: 4.9,
      responseTime: 'Within 1 hour',
    ),
    location: 'Stuttgart, Germany',
    description: 'Ultra-luxury electric sedan with state-of-the-art technology',
    basics: CarBasics(
      batteryCapacity: '107.8 kWh',
      seatingCapacity: 5,
      doors: 4,
    ),
    features: [
      'Air Conditioning',
      'Bluetooth',
      'Sunroof',
      'GPS',
      'Leather Seats',
      'Heated Seats',
    ],
    insuranceDetails: 'Premium Insurance Package',
    cancellationPolicy: 'Full Refund 72 Hours Prior',
    reviews: [
      Review(
        reviewerName: 'Michael K.',
        profileImage: 'assets/Images/lease.jpg',
        date: '2023-08-10',
        content:
            'Exceptional comfort and technology, truly a marvel of engineering!',
        rating: 5.0,
      ),
    ],
    ratings: [
      Rating(category: 'Luxury', score: 5.0),
      Rating(category: 'Innovation', score: 4.9),
    ],
  ),
];
