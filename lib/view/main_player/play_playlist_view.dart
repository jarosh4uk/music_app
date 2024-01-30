
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/common_widget/all_row_songs.dart';
import 'package:music_app/view_model/all_songs_view_model.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../common_widget/player_bottom_player.dart';
import 'driver_mode_view.dart';


class PlayPlayerView extends StatefulWidget {
  const PlayPlayerView({super.key});

  @override
  State<PlayPlayerView> createState() => _PlayPlayerView();

}

class _PlayPlayerView extends State<PlayPlayerView> {

  final allVM = Get.put(AllSongsViewModel());

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
            Get.back();
          },
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/back.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ),

        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: media.width*0.25),
          child: Text("Playlist", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: tColor.primaryText80),),
        ),
        actions: [
          PopupMenuButton(
              color: const Color(0xff383B49),
              offset: const Offset(-10, 15),
              elevation: 1,
              padding: EdgeInsets.zero,
              onSelected: (selectIndex) {
                if(selectIndex==10){
                  Get.to(() => const DriverModeView());
                }
              },
              icon: Image.asset(
                  "assets/images/more_btn.png",
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              itemBuilder: (context){
                return const [
                  PopupMenuItem(
                    value: 1,
                    height: 30,
                    child: Text(
                      "Social Share",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    height: 30,
                    child: Text(
                      "Playing Queue",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    height: 30,
                    child: Text(
                      "Add to Playlist...",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    height: 30,
                    child: Text(
                      "Social Share",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 5,
                    height: 30,
                    child: Text(
                      "Lyrics",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 6,
                    height: 30,
                    child: Text(
                      "Sleep Timer",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 7,
                    height: 30,
                    child: Text(
                      "Volume",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 8,
                    height: 30,
                    child: Text(
                      "Details",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 9,
                    height: 30,
                    child: Text(
                      "Equaliser",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  PopupMenuItem(
                    value: 10,
                    height: 30,
                    child: Text(
                      "Driver Mode",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ];
              }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: null,
                      icon: Image.asset("assets/images/previous_song.png"),
                    ),
                  ),
                  Stack(
                    children: [
                      const SizedBox(height: 20.0,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(media.width*0.4),
                        child: Image.asset(
                          "assets/images/player_image.png",
                          height: media.width*0.4,
                          width: media.width*0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: media.width*0.4,
                        height: media.width*0.4,
                        child: SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            customWidths: CustomSliderWidths(
                                trackWidth: 4,
                                progressBarWidth: 6,
                                shadowWidth: 8
                            ),
                            customColors: CustomSliderColors(
                                dotColor: const Color(0xffFFB1B2),
                                trackColor:
                                const Color(0xffffffff).withOpacity(0.3),
                                progressBarColors: [
                                  const Color(0xffFB9967),
                                  const Color(0xffE9585A)
                                ],
                                shadowColor: const Color(0xffFFB1B2),
                                shadowMaxOpacity: 0.05),
                            infoProperties: InfoProperties(
                              topLabelText: 'Elapsed',
                              topLabelStyle: const TextStyle(
                                color: Colors.transparent,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              bottomLabelText: 'time',
                              bottomLabelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.transparent,
                              ),
                              mainLabelStyle: const TextStyle(
                                color: Colors.transparent,
                                fontWeight: FontWeight.w600,
                                fontSize: 50,
                              ),
                            ),
                            startAngle: 270,
                            angleRange: 360,
                            size: 350.0,
                          ),
                          min: 0,
                          max: 100,
                          initialValue: 60,
                          onChange: (double value) {
                            // callback providing a value while its being changed (with a pan gesture)
                          },
                          onChangeStart: (double startValue) {
                            // callback providing a starting value (when a pan gesture starts)
                          },
                          onChangeEnd: (double endValue) {
                            // ucallback providing an ending value (when a pan gesture ends)
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/images/next_song.png"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "3:14|4:26",
              style: TextStyle(color: tColor.secondaryText, fontSize: 12),
            ),
            const SizedBox(height: 25.0,),
            Text(
              "Black or White",
              style: TextStyle(
                color: tColor.primaryText.withOpacity(0.9),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "Michael Jackson • Album - Dangerous",
              style: TextStyle(color: tColor.secondaryText, fontSize: 12),
            ),
            const SizedBox(height: 20.0,),
            Obx(() => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allVM.allList.length,
                    itemBuilder: (context, index){
                      var sObj = allVM.allList[index];
                      return AllRowSongs(
                          sObj: sObj,
                          onPressedPlay: () {},
                          onPressed: () {},
                      );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}
