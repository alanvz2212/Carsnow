import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CAppbar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  const CAppbar({super.key, this.title, this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
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
        trailing ?? IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
      backgroundColor: const Color(0xFF3b0578),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
