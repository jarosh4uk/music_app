import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:music_app/common_widget/viewall_section.dart';
import 'package:music_app/view_model/playlist_view_model.dart';

import '../../common_widget/my_playlist_cell.dart';
import '../../common_widget/playlist_songs_cell.dart';

class PlaylistsView extends StatefulWidget {
  const PlaylistsView({super.key});

  @override
  State<PlaylistsView> createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> {
  final plVM = Get.put(PlaylistsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff23273B),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset("assets/images/add.png",
          width: 12,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
                  () => GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     childAspectRatio: 1.8,
                     crossAxisSpacing: 0,
                     mainAxisSpacing: 0,
                   ),
                     itemCount: plVM.playlistArr.length,
                     itemBuilder: (context, index) {
                     var pObj = plVM.playlistArr[index];
                      return PlaylistSongsCell(
                       pObj: pObj,
                       onPressed: () {},
                       onPressedPlay: () {},
                  );
                },
              ),
            ),
            ViewAllSection(title: "My Playlists", onPressed: () {}),
            SizedBox(
              height: 170,
              child: Obx(
                    () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: plVM.myPlaylistArr.length,
                    itemBuilder: (context, index) {
                      var pObj = plVM.myPlaylistArr[index];

                      return MyPlaylistCell(
                        pObj: pObj,
                        onPressed: () {},
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}