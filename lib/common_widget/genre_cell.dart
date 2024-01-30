import 'package:flutter/material.dart';
import 'package:music_app/common/color_constants.dart';

class GenreCell extends StatelessWidget {
  const GenreCell({super.key, required this.onPress, required this.cObj});
  final VoidCallback onPress;
  final Map cObj;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
       children: [
         Image.asset(
             cObj["image"],
           width: double.maxFinite,
           height: double.maxFinite,
           fit: BoxFit.cover,
         ),
         Container(
           color: Colors.black87,
           width: double.maxFinite,
           height: double.maxFinite,
         ),
         Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text(
               cObj["name"],
               style: TextStyle(
                 fontSize: 15,
                 color: tColor.primaryText,
                 fontWeight: FontWeight.w700,
               ),
             ),
             Text(
               cObj["songs"],
               style: TextStyle(
                 fontSize: 10,
                 color: tColor.primaryText,
                 fontWeight: FontWeight.w700,
               ),
             ),
           ],
         ),
       ],
    );
  }
}
