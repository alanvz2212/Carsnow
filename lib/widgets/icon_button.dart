import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? iconcolor;
  const ButtonWithIcon({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.color,
    this.width,
    this.height,
    this.textStyle,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.0,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: iconcolor ?? Colors.white),
        label: Text(text, style: AppTextStyles.bodyRegular()),
      ),
    );
  }
}
