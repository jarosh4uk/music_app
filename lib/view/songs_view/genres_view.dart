import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/view_model/genres_view_model.dart';

import '../../common_widget/genre_cell.dart';

class GenresView extends StatefulWidget {
  const GenresView({super.key});

  @override
  State<GenresView> createState() => _GenresViewState();
}

class _GenresViewState extends State<GenresView> {

  final genVM = Get.put(GenresViewModel());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.4,
        ),
        itemCount: genVM.allList.length,
        itemBuilder: (context, index){
        var cObj = genVM.allList[index];
          return GenreCell(
            onPress: () {  },
            cObj: cObj,
          );
        },
    );
  }
}
