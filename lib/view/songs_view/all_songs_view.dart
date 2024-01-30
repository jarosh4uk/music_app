import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/common_widget/all_row_songs.dart';

import '../../view_model/all_songs_view_model.dart';
import '../main_player/main_player_view.dart';

class AllSongsView extends StatefulWidget {
  const AllSongsView({super.key});

  @override
  State<AllSongsView> createState() => _AllSongsViewState();
}

class _AllSongsViewState extends State<AllSongsView> {
  final allVM = Get.put(AllSongsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
        itemCount: allVM.allList.length,
        itemBuilder: (context, index) {
          var sObj = allVM.allList[index];
          return AllRowSongs(
            sObj: sObj,
            onPressed: () {},
            onPressedPlay: () {
              Get.to(() => const MaimPlayerView()); //const MainPlayerView());
            },
          );
        },
       ),
      ),
    );
  }
}
