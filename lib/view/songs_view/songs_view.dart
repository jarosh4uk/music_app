import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:music_app/view/songs_view/albums_view.dart';
import 'package:music_app/view/songs_view/all_songs_view.dart';
import 'package:music_app/view/songs_view/artist_view.dart';
import 'package:music_app/view/songs_view/genres_view.dart';
import 'package:music_app/view/songs_view/playlistview.dart';

import '../../view_model/splash_viewmodel.dart';


class SongsView extends StatefulWidget {
  const SongsView({super.key});

  @override
  State<SongsView> createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView> with SingleTickerProviderStateMixin {

  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

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
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/menu.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ),

        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: media.width*0.27),
          child: Text("Songs", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: tColor.primaryText80),),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Get.find<SplashViewMode>().openDrawer();
              } ,
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
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: TabBar(
              isScrollable: true,
              controller: controller,
                indicatorColor: tColor.focus,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: tColor.focus,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 15,
                  color: tColor.primaryText80,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(
                    text: "All Songs",
                    height: 20,
                  ),
                  Tab(
                    text: "Playlists",
                  ),
                  Tab(
                    text: "Albums",
                  ),
                  Tab(
                    text: "Artists",
                  ),
                  Tab(
                    text: "Genre",
                  ),
                ]
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  AllSongsView(),
                  PlaylistsView(),
                  AlbumsView(),
                  ArtistsView(),
                  GenresView(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
