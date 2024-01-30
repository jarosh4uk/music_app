import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';

class ViewAllSection extends StatelessWidget {
  const ViewAllSection({super.key, required this.title, this.buttonTitle="View All", required this.onPressed});
  final String title;
  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: tColor.primaryText80,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: tColor.org,
                fontSize: 11,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
