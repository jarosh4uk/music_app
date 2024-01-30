import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/view/main_player/driver_mode_view.dart';
import 'package:music_app/view/main_player/play_playlist_view.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common_widget/player_bottom_player.dart';


class MaimPlayerView extends StatefulWidget {
  const MaimPlayerView({super.key});

  @override
  State<MaimPlayerView> createState() => _MaimPlayerViewState();
}

class _MaimPlayerViewState extends State<MaimPlayerView> {

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
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: media.width*0.2),
          child: Text("Now Playing", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: tColor.primaryText80),),
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
              child: Stack(
                children: [
                  const SizedBox(height: 50.0,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(media.width*0.7),
                    child: Image.asset(
                        "assets/images/player_image.png",
                      height: media.width*0.7,
                      width: media.width*0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: media.width*0.7,
                    height: media.width*0.7,
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
            ),
            const SizedBox(height: 15.0,),
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
            const Image(
                image: AssetImage(
                    "assets/images/eq_display.png",
                ),
              height: 60,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(
                color: Colors.white12,
                height: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset("assets/images/previous_song.png"),
                  ),
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset("assets/images/play.png"),
                  ),
                ),
                const SizedBox(width: 20,),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerBottomButton(
                    title: "Playlist",
                    icon: "assets/images/playlist.png",
                    onPressed: () {
                      Get.to( () => const PlayPlayerView());
                    }),
                PlayerBottomButton(
                    title: "Shuffle",
                    icon: "assets/images/shuffle.png",
                    onPressed: () {}),
                PlayerBottomButton(
                    title: "Repeat",
                    icon: "assets/images/repeat.png",
                    onPressed: () {}),
                PlayerBottomButton(
                    title: "EQ",
                    icon: "assets/images/eq.png",
                    onPressed: () {}),
                PlayerBottomButton(
                    title: "Favourites",
                    icon: "assets/images/fav.png",
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
