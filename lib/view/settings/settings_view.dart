import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/common/color_constants.dart';

import 'package:music_app/common_widget/text_row_menu.dart';
import '../../view_model/splash_viewmodel.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
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
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: media.width*0.25),
          child: Text("Settings", textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: tColor.primaryText80),),
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
      body: ListView(
        children: [
          TextRowMenu(
              image: "assets/images/s_display.png",
              text: "Display",
              onTap: () {}
          ),
          TextRowMenu(
              image: "assets/images/s_headset.png",
              text: "Headset",
              onTap: () {}
          ),
          TextRowMenu(
              image: "assets/images/s_audio.png",
              text: "Audio",
              onTap: () {}
          ),
          TextRowMenu(
              image: "assets/images/s_lock_screen.png",
              text: "Lock Screen",
              onTap: () {}
          ),
          TextRowMenu(
              image: "assets/images/s_menu.png",
              text: "Advanced",
              onTap: () {}
          ),
          TextRowMenu(
              image: "assets/images/s_other.png",
              text: "Other",
              onTap: () {}
          ),
        ],

      ),
    );
  }
}
