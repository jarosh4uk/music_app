import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SongsRow extends StatefulWidget {
  final Map sObj;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;
  const SongsRow({super.key, required this.sObj, required this.onPressedPlay, required this.onPressed});

  @override
  State<SongsRow> createState() => _SongsRowState();
}

class _SongsRowState extends State<SongsRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: widget.onPressedPlay,
                icon: Image.asset(
                  "assets/images/play_btn.png",
                  width: 25,
                  height: 25,
                )
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.sObj["name"],
                        maxLines: 1,
                        style: TextStyle(
                          color: tColor.secondaryText,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                    ],
                  ),
                  Text(
                    widget.sObj["artists"],
                    maxLines: 1,
                    style: TextStyle(
                      color: tColor.secondaryText,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/fav.png",
                  width: 12,
                  height: 12,
                ),
                const SizedBox(
                  height: 5,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    unratedColor: tColor.org.withOpacity(0.2),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: tColor.org,
                    ),
                    updateOnDrag: false,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.07),
          indent: 50,


        ),
      ],
    );
  }
}
