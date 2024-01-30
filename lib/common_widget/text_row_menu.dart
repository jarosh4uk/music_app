import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';

class TextRowMenu extends StatelessWidget {
  const TextRowMenu({super.key, required this.image, required this.text, required this.onTap});
  final String image;
  final String text;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return  Column(
    mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 44,
          child: ListTile(
            leading: Image.asset(
              image,
              height: 25,
              width: 25,
              fit: BoxFit.contain,
            ),
            title: Text(
              text,
              style: TextStyle(
                  color: tColor.primaryText.withOpacity(0.9),
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              ),
            ),
            onTap: onTap,
          ),
        ),
        Divider(
          color: tColor.primaryText.withOpacity(0.07),
          indent: 60,
        ),
      ],
    );
  }
}
