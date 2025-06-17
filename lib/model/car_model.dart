import 'package:carsnow/model/car_basics.dart';
import 'package:carsnow/model/host_model.dart';
import 'package:carsnow/model/pricing_model.dart';
import 'package:carsnow/model/rating_model.dart';
import 'package:carsnow/model/review_model.dart';

class Car {
  final String id; // Unique identifier for the car
  final String name; // Name of the car (e.g., Tesla Roadster)
  final String brandId; // Foreign key referencing the Brand
  final List<String> images; // List of image paths/URLs for the car
  final Pricing pricing; // Rental pricing details
  final Host host; // Host details
  final String location; // Pickup & return location
  final String description; // Description of the car
  final CarBasics basics; // Basic specifications like battery, capacity, etc.
  final List<String> features; // List of features (e.g., GPS, Bluetooth)
  final String insuranceDetails; // Insurance details
  final String cancellationPolicy; // Cancellation policy
  final List<Review> reviews; // List of reviews for the car
  final List<Rating> ratings; // Rating details

  Car({
    required this.id,
    required this.name,
    required this.brandId,
    required this.images,
    required this.pricing,
    required this.host,
    required this.location,
    required this.description,
    required this.basics,
    required this.features,
    required this.insuranceDetails,
    required this.cancellationPolicy,
    required this.reviews,
    required this.ratings,
  });
}
