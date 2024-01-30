import 'dart:ui';
import 'package:music_app/common/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widget/album_songs_row.dart';
import '../../common_widget/artist_albumcell.dart';
import '../../common_widget/viewall_section.dart';

import '../../view_model/artists_view_model.dart';
import '../../view_model/splash_viewmodel.dart';

class ArtistDetailsView extends StatefulWidget {
  const ArtistDetailsView({super.key});

  @override
  State<ArtistDetailsView> createState() => _ArtistDetailsViewState();
}

class _ArtistDetailsViewState extends State<ArtistDetailsView> {
  final artVM = Get.put(ArtistsViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "assets/images/back.png",
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Artist Details",
          style: TextStyle(
              color: tColor.primaryText80,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.find<SplashViewMode>().openDrawer();
            },
            icon: Image.asset(
              "assets/images/search.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: tColor.primaryText35,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Image.asset(
                        "assets/images/artitst_detail_top.png",
                        width: double.maxFinite,
                        height: media.width * 0.45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black54,
                    width: double.maxFinite,
                    height: media.width * 0.45,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Dilon Bruce",
                                      style: TextStyle(
                                          color:
                                          tColor.primaryText.withOpacity(0.9),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Pop rock, Funk pop, Heavy Metal",
                                      style: TextStyle(
                                          color:
                                          tColor.primaryText.withOpacity(0.74),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),

                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "4,357",
                                  style: TextStyle(
                                      color:
                                      tColor.primaryText.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                      color:
                                      tColor.primaryText60,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "128,980",
                                  style: TextStyle(
                                      color:
                                      tColor.primaryText.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Listners",
                                  style: TextStyle(
                                      color: tColor.primaryText60,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(17.5),
                              onTap: () {},
                              child: Container(
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: tColor.primaryG,
                                    begin: Alignment.topCenter,
                                    end: Alignment.center,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Follow",
                                      style: TextStyle(
                                          color: tColor.primaryText
                                              .withOpacity(0.74),
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),),
            ViewAllSection(title: "Top Albums", onPressed: () {}),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: artVM.albumsArr.length,
                  itemBuilder: (context, index) {
                    var aObj = artVM.albumsArr[index];
                    return ArtistAlbumCell(aObj: aObj);
                  }),
            ),
            ViewAllSection(title: "Top Songs", onPressed: (){
            }),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: artVM.playedArr.length,
                itemBuilder: (context, index) {
                  var sObj = artVM.playedArr[index];
                  return AlbumSongRow(
                    sObj: sObj,
                    onPressed: () {},
                    onPressedPlay: () {},
                    isPlay: index == 0,
                  );
                })
          ],
        ),
      ),

    );
  }
}