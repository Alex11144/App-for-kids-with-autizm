import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_sound/public/util/flutter_sound_helper.dart';
import 'package:kids_app/data/provider_for_cards.dart';
import 'package:kids_app/ui/list_for_kids.dart';
import 'package:kids_app/ui/settings/settings_main.dart';
import 'package:provider/provider.dart';

AudioPlayer player1 = AudioPlayer();
// int currentIndex1 = 0;
AudioPlayer player2 = AudioPlayer();
bool flag = false;
int currentIndex1 = 0;
AudioPlayer player3 = AudioPlayer();
bool isPlayer3 = false;
AudioPlayer player4 = AudioPlayer();
AudioPlayer player5 = AudioPlayer();
AudioPlayer player6 = AudioPlayer();
AudioPlayer player7 = AudioPlayer();
AudioPlayer player8 = AudioPlayer();

class AudioProvider extends ChangeNotifier {
  void playAudios() async {
    try {
      if (draggedItems[0].audio != null) {
        ByteData bytes = await rootBundle
            .load(draggedItems[0].audio!); //load sound from assets
        Uint8List soundbytes =
            bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        // await player
        //     .playBytes(soundbytes);
        await player3.playBytes(soundbytes);
      } else {
        await player3.play(draggedItems[0].fileAudio!, isLocal: true);
      }
    } catch (e) {}

    player3.onPlayerCompletion.listen((event) async {
      player3.stop();
      try {
        if (draggedItems[1].audio != null) {
          ByteData bytes = await rootBundle
              .load(draggedItems[1].audio!); //load sound from assets
          Uint8List soundbytes = bytes.buffer
              .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
          // await player
          //     .playBytes(soundbytes);
          await player4.playBytes(soundbytes);
        } else {
          await player4.play(draggedItems[1].fileAudio!, isLocal: true);
        }
      } catch (e) {}
    });

    player4.onPlayerCompletion.listen((event) async {
      player4.stop();

      try {
        if (draggedItems[2].audio != null) {
          ByteData bytes = await rootBundle
              .load(draggedItems[2].audio!); //load sound from assets
          Uint8List soundbytes = bytes.buffer
              .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
          // await player
          //     .playBytes(soundbytes);
          await player5.playBytes(soundbytes);
        } else {
          await player5.play(draggedItems[2].fileAudio!, isLocal: true);
        }
      } catch (e) {}
    });
    player5.stop();

    if (draggedItems.length > 3) {
      player5.onPlayerCompletion.listen((event) async {
        try {
          if (draggedItems[3].audio != null) {
            ByteData bytes = await rootBundle
                .load(draggedItems[3].audio!); //load sound from assets
            Uint8List soundbytes = bytes.buffer
                .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
            // await player
            //     .playBytes(soundbytes);
            await player6.playBytes(soundbytes);
          } else {
            await player6.play(draggedItems[3].fileAudio!, isLocal: true);
          }
        } catch (e) {}
      });
    } else if (draggedItems.length > 4) {
      player6.onPlayerCompletion.listen((event) async {
        player6.stop();
        try {
          if (draggedItems[4].audio != null) {
            ByteData bytes = await rootBundle
                .load(draggedItems[4].audio!); //load sound from assets
            Uint8List soundbytes = bytes.buffer
                .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
            // await player
            //     .playBytes(soundbytes);
            await player7.playBytes(soundbytes);
          } else {
            await player7.play(draggedItems[4].fileAudio!, isLocal: true);
          }
        } catch (e) {}
      });
    } else if (draggedItems.length > 5) {
      player7.onPlayerCompletion.listen((event) async {
        player7.stop();

        try {
          if (draggedItems[5].audio != null) {
            ByteData bytes = await rootBundle
                .load(draggedItems[5].audio!); //load sound from assets
            Uint8List soundbytes = bytes.buffer
                .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
            // await player
            //     .playBytes(soundbytes);
            await player8.playBytes(soundbytes);
          } else {
            await player8.play(draggedItems[5].fileAudio!, isLocal: true);
          }
        } catch (e) {}
      });

      player8.stop();
    }
  }

  void isPlayedFlag(playerFlag) {
    playerFlag.onPlayerCompletion.listen((event) {
      isPlayed = false;
      notifyListeners();
    });
  }

  play(List<dynamic> urlList, int currentIndex, context) async {
    try {
      if (draggedItems[currentIndex].audio != null) {
        ByteData bytes = await rootBundle
            .load(draggedItems[currentIndex].audio!); //load sound from assets
        Uint8List soundbytes =
            bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        // await player
        //     .playBytes(soundbytes);
        await player2.playBytes(soundbytes);
      } else {
        await player2.play(draggedItems[currentIndex].fileAudio!,
            isLocal: true);
      }
    } catch (e) {}
  }

  void nextTrack(List<dynamic> urlList, int currentIndex, context) {
    play(urlList, currentIndex, context);
    player2.onPlayerCompletion.listen((event) {
      if (currentIndex < urlList.length - 1) {
        currentIndex = currentIndex + 1;

        notifyListeners();
        nextTrack(urlList, currentIndex, context);
        player2.stop();
        print("NEXT AUDIO! $currentIndex");
      } else {
        print("AUDIO COMPLETED PLAYING");
        currentIndex = 0;
        notifyListeners();
        player2.stop();

        notifyListeners();
      }
    });
    // if (currentIndex == 1) {
    //   currentIndex = 0;
    //   notifyListeners();
    // }
  }

  // bool showLottie = false;
  Future<void> audioPlayer(
    items,
    index1,
    context,
  ) async {
    final draggedMusic = Provider.of<CardsProvider>(context, listen: false);

    player.stop();
    player1.stop();
    if (items[index1].audio != null) {
      audioasset = items[index1].audio!;
      ByteData bytes =
          await rootBundle.load(items[index1].audio!); //load sound from assets
      Uint8List soundbytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      await player.playBytes(soundbytes);
    } else {
      await player.play(audioasset = items[index1].fileAudio!, isLocal: true);
    }
    //flutter run --release
    if (draggedItems.length == 3 && draggedMusic.selectedValueForCards == 0 ||
        draggedItems.length == 4 && draggedMusic.selectedValueForCards == 1 ||
        draggedItems.length == 5 && draggedMusic.selectedValueForCards == 2 ||
        draggedItems.length == 6 && draggedMusic.selectedValueForCards == 3) {
      isPlayed = true;
      player.stop();
      player1.stop();
      // player2.stop();
      notifyListeners();
      if (isCongratulated) {
        ByteData bytes =
            await rootBundle.load(audioasset1); //load sound from assets
        Uint8List soundbytes =
            bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        await player.playBytes(soundbytes);
        notifyListeners();
      }
      // showLottie = true;
      // Example();
      Future.delayed(Duration(seconds: isCongratulated ? 6 : 1), () {
        // deleayed code here
        playAudios();
        // currentIndex1 = 0;
        notifyListeners();
      });
      Future.delayed(Duration(milliseconds: isCongratulated ? 8500 : 2500), () {
        // deleayed code here
        isPlayed = false;
        notifyListeners();
        // nextTrack(draggedItems, currentIndex);
      });
      // setState(() {});
    }
    if (draggedItems.length == 0) {
      // player2.stop();
      player.stop();

      // currentIndex1 = 0;
      currentIndex1 = 0;
      notifyListeners();
    }
  }
}
