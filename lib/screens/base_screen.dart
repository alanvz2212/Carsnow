import 'package:carsnow/screens/home_page.dart';
import 'package:carsnow/screens/host_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HostScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          _buildTabItem(Icons.message, 'Message', 0),
          _buildTabItem(FontAwesomeIcons.road, 'Trips', 1),
          _buildTabItem(Icons.home, 'Home', 2),
          _buildTabItem(Icons.favorite, 'Favorites', 3),
          _buildTabItem(Icons.person, 'Host', 4),
        ],
      ),
    );
  }

  TabItem _buildTabItem(IconData icon, String label, int index) {
    return TabItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Smooth transition
        width: _selectedIndex == index ? 60 : 45, // Bulging effect size change
        height: _selectedIndex == index ? 60 : 45, // Bulging effect size change
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.green : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: _selectedIndex == index ? 22 : 15, // Larger icon for selected
          color: _selectedIndex == index
              ? Colors.white
              : const Color(0xFF3B0578),
        ),
      ),
      title: label, // Pass the label directly as a string
    );
  }
}
