import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';
class PlaylistSongsCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;
  final VoidCallback onPressedPlay;
  const PlaylistSongsCell({
    super.key,
    required this.pObj,
    required this.onPressed,
    required this.onPressedPlay,
  });

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          pObj["image"],
          //width: double.maxFinite,
          //height: double.maxFinite,
          width: double.maxFinite,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.maxFinite,
          height: double.maxFinite,


          color: Colors.black45,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        pObj["name"],
                        maxLines: 1,
                        style: TextStyle(
                            color: tColor.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        pObj["songs"],
                        maxLines: 1,
                        style: TextStyle(
                            color: tColor.primaryText28, fontSize: 11),
                      ),
                    ]),
              ),
              InkWell(
                onTap: onPressedPlay,
                child: Image.asset(
                  "assets/images/play.png",
                  width: 22,
                  height: 22,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}