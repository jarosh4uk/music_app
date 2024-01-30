
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeModel extends GetxController {
  final textSearch = TextEditingController().obs;

  final hostRecomendedArr = [
    {
      "image": "assets/images/img_1.png",
      "name": "Sound 0f Sky",
      "artists": "Dilon Bruce"
    },
    {
      "image": "assets/images/img_2.png",
      "name": "Girls on Fire",
      "artists": "Alicia Keys"
    }
  ].obs;

  final playListArr = [
    {
      "image": "assets/images/img_3.png",
      "name": "Classic Playlist",
      "artists": "Piano Guys"
    },
    {
      "image": "assets/images/img_4.png",
      "name": "Summer Playlist",
      "artists": "Dilon Bruce"
    },
    {
      "image": "assets/images/img_5.png",
      "name": "Pop Music",
      "artists": "Michael Jackson"
    }
  ];


  final recentlyPlayedArr = [
    {
      "rate": "4",
      "name": "Billie Jean",
      "artists": "Michael Jackson"
    },
    {
      "rate": "4",
      "name": "Earth Song",
      "artists": "Michael Jackson"
    },
    {
      "rate": "4",
      "name": "Mirror",
      "artists": "Justin Timberlake"
    },
    {
      "rate": "4",
      "name": "Remember the time",
      "artists": "Michael Jackson"
    }
  ].obs;
}