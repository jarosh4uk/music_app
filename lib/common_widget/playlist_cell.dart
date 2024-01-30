import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';

class PlaylistCell extends StatelessWidget {
  const PlaylistCell({super.key, required this.mObj});
  final Map mObj;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,

      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              mObj["image"],

                fit: BoxFit.cover,
            )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),

            child: Text(
              mObj["name"],
              maxLines: 1,
              style: TextStyle(
                  color: tColor.primaryText60,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            mObj["artists"],
              maxLines: 1,
            style: TextStyle(
              color: tColor.secondaryText,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
