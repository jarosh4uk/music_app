import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:music_app/common_widget/recommended_section.dart';
import 'package:music_app/common_widget/songs_row.dart';
import 'package:music_app/common_widget/title_style.dart';
import 'package:music_app/common_widget/viewall_section.dart';
import 'package:music_app/view_model/home_viewmodel.dart';
import 'package:music_app/view_model/splash_viewmodel.dart';

import '../../common_widget/playlist_cell.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeVM = Get.put(HomeModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //primary: false,
        toolbarHeight: 105,
        backgroundColor: tColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.find<SplashViewMode>().openDrawer();
          },
          icon: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Image.asset(
                "assets/images/menu.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xff292e48),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: TextField(
                    controller: HomeVM.textSearch.value,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        alignment: Alignment.centerLeft,
                        width: 40,
                        margin: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                            "assets/images/search.png",
                          width: 20,
                          height: 20,
                          color: tColor.primaryText28,
                          fit: BoxFit.contain,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "Search album song",
                      hintStyle: TextStyle(
                        color: tColor.primaryText28,
                        fontSize: 13,
                      )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleStyle(title: "Hot Recommendation"),
            SizedBox(
              height: 180,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10, ),
                  scrollDirection: Axis.horizontal,
                itemCount: HomeVM.hostRecomendedArr.length,
                itemBuilder: (BuildContext context, int index) {
                    var mObj = HomeVM.hostRecomendedArr[index];
                    return RecommendedSection(mObj : mObj);
               }),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(
                title: "Playlist",
                onPressed:() {},
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeVM.playListArr.length,
                  itemBuilder: (context, index) {
                    var mObj = HomeVM.playListArr[index];
                    return PlaylistCell(mObj: mObj);
                  }),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(
              title: "Recently Played",
              onPressed:() {},
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),

                itemCount: HomeVM.playListArr.length,
                itemBuilder: (context, index) {
                  var sObj = HomeVM.recentlyPlayedArr[index];
                  return SongsRow( sObj: sObj,
                    onPressedPlay: () {},
                    onPressed: () {},
                  );
                }),
          ],
        ),
      ),
    );
  }
}
