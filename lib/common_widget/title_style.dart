import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';

class TitleStyle extends StatelessWidget {
  const TitleStyle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: tColor.primaryText80,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
