import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/common_widget/all_row_songs.dart';
import 'package:music_app/view/main_player/play_playlist_view.dart';
import 'package:music_app/view_model/all_songs_view_model.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../common_widget/player_bottom_player.dart';


class DriverModeView extends StatefulWidget {

  const DriverModeView({super.key});

  @override
  State<DriverModeView> createState() => _DriverModeViewState();
}

class _DriverModeViewState extends State<DriverModeView> {

  @override
  Widget build(BuildContext context) {
    var slidervar = 0.7;
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
              "assets/images/close.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: media.width*0.2),
          child: Text("Driver Mode", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: tColor.primaryText80),),
        ),
        actions: [
          IconButton(
            onPressed: (){} ,
            icon: Image.asset(
              "assets/images/playlist.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          )
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
            const SizedBox(height: 35.0,),
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
            Text(
              "232/176",
              style: TextStyle(color: tColor.secondaryText, fontSize: 12),
            ),
            const SizedBox(height: 20.0,),
            Slider(
              activeColor: tColor.focus,
                inactiveColor: tColor.primaryText35,
                value: slidervar,
                onChanged: (newVal){
                  setState(() {
                    slidervar = newVal;
                  });
                }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "3:35",
                    style: TextStyle(color: tColor.primaryText60, fontSize: 12),

                  ),
                  Text(
                    "2:13",
                    style: TextStyle(color: tColor.primaryText60, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset("assets/images/previous_song.png"),
                  ),
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset("assets/images/play.png"),
                  ),
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/next_song.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
