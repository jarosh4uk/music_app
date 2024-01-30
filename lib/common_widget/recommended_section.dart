import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';


class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key, required this.mObj});
  final Map mObj;


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 220,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(mObj["image"],
              width: double.maxFinite,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              mObj["name"],
              maxLines: 1,
              style: TextStyle(
                fontSize: 13,
                color: tColor.primaryText60,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            mObj["artists"],
            maxLines: 1,
            style: TextStyle(
              fontSize: 10,
              color: tColor.primaryText28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
