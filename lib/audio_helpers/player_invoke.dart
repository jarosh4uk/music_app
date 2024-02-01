
import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:music_app/audio_helpers/page_manager.dart';
import 'package:music_app/audio_helpers/service_locator.dart';
import 'package:music_app/audio_helpers/mediaitem_converter.dart';


DateTime playerTapTime = DateTime.now();
bool get isProcessForPlay {
  return DateTime.now().difference(playerTapTime).inMilliseconds > 600;
}

Timer? debounce;
void playerPlayProcessDebounce(List songsList, int index){
  debounce?.cancel();
  debounce = Timer(const Duration(milliseconds: 600), () {
    PlayerIvoke.init(songsList: songsList, index: index);
  });
}

class PlayerIvoke{
  static final pageManager = getIt<PageManager>();

  static Future<void> init({
    required List songsList,
    required int index,
    bool fromMiniPlayer = false,
    bool shuffle = false,
    String? playlistBox,
}) async {
    final int globalIndex = index < 0 ? 0 : index;
    final finalList = songsList.toList();
    if(shuffle) finalList.shuffle();
    if(!fromMiniPlayer){
      if(!Platform.isAndroid){
        await pageManager.stop();
      }
      setValues(finalList, globalIndex);
    }
  }
  
  static Future<void> setValues(List arr, int index, {recommended = false}) async{
    final List<MediaItem> queue = [];
    final Map playItem = arr[index] as Map;
    final Map? nextItem = index == arr.length - 1 ? null : arr[index+1] as Map;
    queue.addAll(arr.map(
        (song) => MediaItemConverter.mapToMediaItem(song as Map, autoplay: recommended)
      )
    );
    updateNPlay(queue, index);
  }

  static Future<void> updateNPlay(List<MediaItem> queue, int index) async{
    try{
      await pageManager.setShuffleMode(AudioServiceShuffleMode.none);
      await pageManager.adds(queue, index);
      await pageManager.playAs();
    } catch(e) {
      print("error: $e");
    }
  }
}

