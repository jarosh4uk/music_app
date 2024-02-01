import 'package:flutter/material.dart';

import 'package:music_app/common/color_constants.dart';

class ArtistAlbumCell extends StatelessWidget {
  final Map aObj;
  const ArtistAlbumCell({super.key, required this.aObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              aObj["image"],
              width: double.maxFinite,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            aObj["name"],
            maxLines: 1,
            style: TextStyle(
                color: tColor.primaryText60,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          Text(
            aObj["year"],
            maxLines: 1,
            style: TextStyle(
              color: tColor.primaryText35,
              fontSize: 10,),
          )
        ],
      ),
    );
  }
}