import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';

class AllRowSongs extends StatelessWidget {
  const AllRowSongs({super.key, required this.sObj, required this.onPressedPlay, required this.onPressed});


  final Map sObj;
  final VoidCallback onPressedPlay;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      sObj["image"],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: tColor.primaryText28),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: tColor.bg,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sObj["name"],
                        maxLines: 1,
                        style: TextStyle(
                            color: tColor.primaryText60,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        sObj["artists"],
                        maxLines: 1,
                        style: TextStyle(color: tColor.primaryText28, fontSize: 10),
                      )
                    ],
                  )),
              IconButton(
                  onPressed: onPressedPlay,
                  icon: Image.asset(
                      "assets/images/play_btn.png",
                    width: 25,
                    height: 25,
                  ),
              ),
            ]
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.07),
          indent: 50,
        ),
      ],
    );
  }
}
