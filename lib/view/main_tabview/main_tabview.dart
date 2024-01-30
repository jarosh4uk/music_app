import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:music_app/common_widget/playlist_cell.dart';
import 'package:music_app/common_widget/text_row_menu.dart';
import 'package:music_app/view/home/home_view.dart';
import 'package:music_app/view/songs_view/songs_view.dart';
import 'package:music_app/view/settings/settings_view.dart';
import 'package:music_app/view_model/splash_viewmodel.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller?.addListener(() {
     selectTab = controller?.index ?? 0;
     setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var splashVM = Get.find<SplashViewMode>();

    return SafeArea(
      child: Scaffold(
        key: splashVM.scaffoldKey,
        drawer: Drawer(
          backgroundColor: const Color(0xff10121D),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 240,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                    color: tColor.primaryText.withOpacity(0.03),
                  ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                              "assets/images/app_logo.png",
                            width: media.width*0.17,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "328\nSongs",
                                  style: TextStyle(
                                    color: Color(0xffc1c0c0),
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "52\nAlbums",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "87\nArtists",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffC1C0C0), fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                ),
              ),
              TextRowMenu(
                  image: "assets/images/m_theme.png",
                  text: "Themes",
                  onTap: () {},
              ),
              TextRowMenu(
                image: "assets/images/m_ring_cut.png",
                text: "Ringtone Cutter",
                onTap: () {},
              ),
              TextRowMenu(
                image: "assets/images/m_sleep_timer.png",
                text: "Sleep Timer",
                onTap: () {},
              ),
              TextRowMenu(
                image: "assets/images/m_eq.png",
                text: "Equliser",
                onTap: () {},
              ),
              TextRowMenu(
                image: "assets/images/m_driver_mode.png",
                text: "Driver Mode",
                onTap: () {},
              ),
              TextRowMenu(
                image: "assets/images/m_hidden_folder.png",
                text: "Hidden Folders",
                onTap: () {
                  splashVM.closeDrawer();
                },
              ),
              TextRowMenu(
                image: "assets/images/m_scan_media.png",
                text: "Scan Media",
                onTap: () {},
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            HomeView(),
            //const PlaylistCell(),
            SongsView(),
            SettingView(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: tColor.bg,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0, -5),
              ),
            ]
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              indicatorWeight: 1,
              labelColor: tColor.primary,
              unselectedLabelColor: tColor.primaryText28,
              labelStyle: const TextStyle(
                fontSize: 10
              ),
              unselectedLabelStyle: const TextStyle(
                  fontSize: 10
              ),
              tabs: [
                Tab(
                  text: "Home",
                  icon: Image.asset(
                      selectTab == 0 ? "assets/images/home_tab.png" : "assets/images/home_tab_un.png",
                      width: 20,
                      height: 20,
                  ),
                ),
                Tab(
                  text: "Songs",
                  icon: Image.asset(
                    selectTab == 1 ? "assets/images/songs_tab.png" : "assets/images/songs_tab_un.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Tab(
                  text: "Settings",
                  icon: Image.asset(
                    selectTab == 2 ? "assets/images/setting_tab.png" : "assets/images/setting_tab_un.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
