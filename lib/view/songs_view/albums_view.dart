import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/common_widget/album_cell.dart';
import 'package:music_app/view_model/albums_view_model.dart';

import 'albums_details.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  final albumVM = Get.put(AlbumViewModel());


@override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var cell = (media.width - 40.0 - 20.0) * 0.5;


    return Scaffold(
      body: Obx(() => GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: cell/(cell+45.0),
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: albumVM.allList.length,
          itemBuilder: (context, index) {
          var aObj = albumVM.allList[index];
            return AlbumCell(
              aObj: aObj,

              onPressed: () {
                Get.to(() => const AlbumDetailsView());
              },
              onPressedMenu: (selectIndex) {
                if (kDebugMode) {
                  print(index);
                }
              },
            );}
      )),
    );
  }
}
