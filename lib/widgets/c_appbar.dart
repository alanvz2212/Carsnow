import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // Nullable title
  final Widget? leading; // Custom leading widget
  final Widget? trailing; // Custom trailing widget

  CAppbar({this.title, this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(title!)
          : null, // Display title if it's not null
      leading:
          leading ??
          IconButton(
            // Default leading widget if not provided
            icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.white),
            onPressed: () {
              // Add your custom leading action here
            },
          ),
      actions: [
        trailing ??
            IconButton(
              // Default trailing widget if not provided
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Add your custom trailing action here
              },
            ),
      ],
      backgroundColor: const Color(0xFF3b0578), // Custom background color
      elevation: 4.0, // Custom elevation for shadow
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Standard AppBar height
}
