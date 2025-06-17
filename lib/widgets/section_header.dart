import 'package:carsnow/widgets/text_style.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.headerBold(color: Colors.black, fontSize: 20),
    );
  }
}
