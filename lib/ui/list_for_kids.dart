import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:kids_app/data/provider_for_audio_player.dart';
import 'package:kids_app/ui/bottom_bar_with_items/bottom_bar.dart';
import 'package:kids_app/ui/lists/draw_list.dart';
import 'package:kids_app/ui/lists/drink_list.dart';
import 'package:kids_app/ui/lists/go_list.dart';
import 'package:kids_app/ui/lists/hygiene_list.dart';
import 'package:kids_app/ui/lists/play_list.dart';
import 'package:kids_app/ui/lists/rest_list.dart';
import 'package:kids_app/ui/my_cards/my_cards.dart';
import 'package:kids_app/ui/settings/settings_main.dart';
import 'package:kids_app/ui/splash_screen/splash_congratulate.dart';
import 'package:provider/provider.dart';
import 'package:kids_app/data/provider_for_cards.dart';
import 'package:kids_app/domain/entities/item_entity.dart';
import 'package:kids_app/ui/lists/eat_list.dart';

import 'main_menu/main_menu.dart';

List draggedItems = [];
List sortedDraggedItems = [];
bool isPlayed = false;
List allLists = [
  drawItems,
  goItems,
  drinkItems,
  hygieneItems,
  playItems,
  restItems,
  drawItems,
  goItems,
  drinkItems,
  hygieneItems,
  playItems,
  drawItems,
  goItems,
  drinkItems,
  hygieneItems
];
List<int> id = [];
// List bosList = [
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   const ModelForItems(),
//   Container(),
//   Container(),
// ];
String audioasset = "";
String audioasset1 = 'assets/audio/congraulation.mp3';

String audioasset2 = "";
String audioasset3 = "";

List items1 = [
  ItemsEntity(
      text: 'Есть',
      id: 2,
      spot: 2,
      image: 'assets/images/есть.jpg',
      audio: 'assets/audio/voxworker-voice-file (2).mp3'),
  ItemsEntity(
      text: 'Играть',
      id: 2,
      spot: 3,
      image: 'assets/images/играть.jpg',
      audio: 'assets/audio/играть.mp3'),
  ItemsEntity(
      text: 'Пойти',
      id: 2,
      spot: 4,
      image: 'assets/images/пойти.webp',
      audio: 'assets/audio/пойти.mp3'),
  ItemsEntity(
      text: 'Гигиена',
      id: 2,
      spot: 5,
      image: 'assets/images/гигиена.jpg',
      audio: 'assets/audio/гигиена.mp3'),
  ItemsEntity(
      text: 'Пить',
      id: 2,
      spot: 6,
      image: 'assets/images/пить.webp',
      audio: 'assets/audio/пить.mp3'),
  ItemsEntity(
      text: 'Рисовать',
      id: 2,
      spot: 7,
      image: 'assets/images/рисовать.jpg',
      audio: 'assets/audio/рисовать.mp3'),
  ItemsEntity(
      text: 'Отдыхать',
      id: 2,
      spot: 8,
      image: 'assets/images/отдыхать.jpg',
      audio: 'assets/audio/отдыхать.mp3'),
  ItemsEntity(
      text: '',
      id: 1000,
      spot: 9,
      image: 'assets/images/SCFK_2017_W.jpg',
      audio: 'assets/audio/мои карточки.mp3'),
  ItemsEntity(
      text: '',
      id: 1000,
      spot: 10,
      image: 'assets/images/plus_PNG106.png',
      audio: 'assets/audio/добавить.mp3'),
];
// bool isPlayed1 = false;
List iWant = [
  ItemsEntity(
      text: 'Я',
      id: 0,
      spot: 0,
      image: 'assets/images/bukvaya.jpg',
      audio: 'assets/audio/voxworker-voice-file.mp3'),
  ItemsEntity(
      text: 'Хочу',
      id: 1,
      spot: 1,
      image: 'assets/images/хочу.jpg',
      audio: 'assets/audio/voxworker-voice-file (1).mp3'),
];
int index3 = 0;
int index4 = 0;
bool isFirstRun = false;
AudioPlayer player = AudioPlayer();
// AudioPlayer playerConcat = AudioPlayer();

class ListTrialForKids extends StatefulWidget {
  const ListTrialForKids({
    super.key,
  });

  @override
  State<ListTrialForKids> createState() => _ListTrialForKidsState();
}

class _ListTrialForKidsState extends State<ListTrialForKids> {
  bool accepted2 = false;
  bool accepted3 = false;
  // late AnimationController _animationController;
  int index1 = 0;
  int index2 = 0;

  static List esasSehifeList2 = [...iWant, ...items1];
  List<ItemsEntity> esasSehifeList = [...iWant, ...items1];
  // List esasSehifeLis2 = [...iWant, ...items1];
  List eatList = [...iWant, ...items2];
  List playList = [...iWant, ...playItems];
  List goList = [...iWant, ...goItems];
  List hygieneList = [...iWant, ...hygieneItems];
  List drinkList = [...iWant, ...drinkItems];
  List drawList = [...iWant, ...drawItems];
  List restList = [...iWant, ...restItems];
  List myCardsList = [
    ...iWant,
    ItemsEntity(
        text: '', id: 1000, spot: 800, image: 'assets/images/plus_PNG106.png'),
  ];
  List navigateBetweenScreens = [
    const EatList(),
    const PlayList(),
    const GoList(),
    const HygieneList(),
    const DrinkList(),
    const DrawList(),
    const RestList(),
    const MyCards()
  ];
  int currentIndex1 = 0;
  @override
  void initState() {
    super.initState();
    if (isFirstRun == false) {
      for (var elem in esasSehifeList) {
        Boxes.getTransactions().put(elem.spot, elem);
      }
      for (var elem in eatList) {
        EatBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in playList) {
        PlayBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in goList) {
        GoBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in hygieneList) {
        HygieneBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in drinkList) {
        DrinkBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in drawList) {
        DrawBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in restList) {
        RestBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      for (var elem in myCardsList) {
        MyCardsBox.getTransactions().put(elem.spot, elem);
        // index3++;
      }
      if (DraggedItemsBox.getTransactions().isNotEmpty) {
        for (var elem in DraggedItemsBox.getTransactions().values.toList()) {
          if (elem.spot > 18 && elem.spot < 101 ||
              elem.spot > 106 && elem.spot < 201 ||
              elem.spot > 205 && elem.spot < 301 ||
              elem.spot > 306 && elem.spot < 401 ||
              elem.spot > 406 && elem.spot < 501 ||
              elem.spot > 504 && elem.spot < 601 ||
              elem.spot > 602 && elem.spot < 701) {
            MyCardsBox.getTransactions().put(elem.spot, elem);
          }
          if (elem.spot < 11) {
            Boxes.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 10 && elem.spot < 101) {
            EatBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 100 && elem.spot < 201) {
            PlayBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 200 && elem.spot < 301) {
            GoBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 300 && elem.spot < 401) {
            HygieneBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 400 && elem.spot < 501) {
            DrinkBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 500 && elem.spot < 601) {
            DrawBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          } else if (elem.spot > 600 && elem.spot < 701) {
            RestBox.getTransactions().put(elem.spot, elem);
            // MyCardsBox.getTransactions().put(elem.spot, elem);
          }
        }
        DraggedItemsBox.getTransactions().clear();
      }
    }

    isFirstRun = true;
    // EatBox.getTransactions().clear();
    // PlayBox.getTransactions().clear();
    // MyCardsBox.getTransactions().clear();
  }

  // var transaction = Boxes.getTransactions().values.toList().cast<ItemsEntity>();
  var color = Colors.black;
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<CardsProvider>();
    final watchAudio = context.watch<AudioProvider>();

    var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - 100) / 3;
    // final double itemWidth = size.width / 5;
    return Stack(children: [
      Image.asset(
        "assets/images/images.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        // key: _formKeyScreen1,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 8),
            child: AppBar(
              // foregroundColor: Colors.black,
              toolbarHeight: MediaQuery.of(context).size.height / 8,
              backgroundColor: const Color.fromARGB(255, 230, 236, 188),
              centerTitle: true,
              actions: [
                IconButton(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SettingsMainScreen()));
                    },
                    icon: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const SettingsMainScreen()));
                          // reset(context, ListTrialForKids());
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.blueGrey,
                          size: 30,
                        ))),
                IconButton(
                    onPressed: () {},
                    icon: IconButton(
                        padding: const EdgeInsets.only(bottom: 20),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                          size: 30,
                        )))
              ],
              title: const Text(
                'Общение',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MainMenu(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(begin: 0.5, end: 1.0);
                        final fadeAnimation = animation.drive(tween);
                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 14, 98, 166),
                  )),
              elevation: 0,
              // backgroundColor: Colors.transparent,
            )),
        body: SafeArea(
          child: DragTarget<int>(
            // onAccept: ((dat1a) {}),
            builder: (context, candidateData, rejectedData) =>
                SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                  child: ValueListenableBuilder(
                      valueListenable: Boxes.getTransactions().listenable(),
                      builder: (context, Box<ItemsEntity> box, _) {
                        final transactions = Boxes.getTransactions()
                            .values
                            .toList()
                            .cast<ItemsEntity>();
                        return AnimationLimiter(
                          key: ValueKey(transactions.length),
                          child: IntrinsicGridView.vertical(
                              // margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              columnCount: 6,
                              horizontalSpace: 10,
                              verticalSpace: 10,
                              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                              // physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              // crossAxisSpacing: 6,
                              // mainAxisSpacing: 6,
                              // crossAxisCount: 6,
                              // childAspectRatio: 1.1,
                              children:
                                  List.generate(transactions.length, (index) {
                                return AnimationConfiguration.staggeredGrid(
                                  columnCount: 6,
                                  duration: const Duration(milliseconds: 800),
                                  position: index,
                                  child: index == transactions.length - 2
                                      ? SizedBox(
                                          width: size.width / 6,
                                          height: (size.height + 20) / 5,
                                          child: ScaleAnimation(
                                            child: FadeInAnimation(
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        transitionDuration:
                                                            Duration.zero,
                                                        pageBuilder:
                                                            (_, __, ___) =>
                                                                const MyCards(),
                                                      ),
                                                    );
                                                    // print(transactions.last.id);
                                                  },
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          transactions
                                                              .elementAt(
                                                                  transactions
                                                                          .length -
                                                                      2)
                                                              .image!,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              9,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              10,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                        Text(
                                                          'My cards',
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  26,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                      : index == transactions.length - 1
                                          ? SizedBox(
                                              width: size.width / 6,
                                              height: (size.height + 50) / 5,
                                              child: ScaleAnimation(
                                                child: FadeInAnimation(
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      onPressed: () =>
                                                          watch.showAlertDialog(
                                                              context),
                                                      child: Image.asset(
                                                          transactions
                                                              .elementAt(
                                                                  transactions
                                                                          .length -
                                                                      1)
                                                              .image!)),
                                                ),
                                              ),
                                            )
                                          : ScaleAnimation(
                                              child: FadeInAnimation(
                                                child: InkWell(
                                                  onTap: () async {
                                                    audioasset =
                                                        transactions[index]
                                                            .audio!;
                                                    if (transactions[index]
                                                            .spot >=
                                                        2) {
                                                      Navigator.push(
                                                        context,
                                                        PageRouteBuilder(
                                                          transitionDuration:
                                                              Duration.zero,
                                                          pageBuilder: (_, __,
                                                                  ___) =>
                                                              navigateBetweenScreens[
                                                                  transactions[
                                                                              index]
                                                                          .spot -
                                                                      2],
                                                        ),
                                                      );
                                                    }

                                                    // if (transactions[index]
                                                    //         .spot ==
                                                    //     2) {
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const EatList(),
                                                    //     ),
                                                    //   );
                                                    //   // setState(() {});
                                                    // } else if (transactions[
                                                    //             index]
                                                    //         .spot ==
                                                    //     3) {
                                                    //   // audioasset =
                                                    //   //     'assets/audio/играть.mp3';
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const PlayList(),
                                                    //     ),
                                                    //   );
                                                    // } else if (transactions[
                                                    //             index]
                                                    //         .spot ==
                                                    //     4) {
                                                    //   // audioasset =
                                                    //   //     'assets/audio/пойти.mp3';
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const GoList(),
                                                    //     ),
                                                    //   );
                                                    // } else if (transactions[
                                                    //             index]
                                                    //         .spot ==
                                                    //     5) {
                                                    //   // audioasset =
                                                    //   //     'assets/audio/гигиена.mp3';
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const HygieneList(),
                                                    //     ),
                                                    //   );
                                                    // } else if (transactions[
                                                    //             index]
                                                    //         .spot ==
                                                    //     6) {
                                                    //   // audioasset =
                                                    //   //     'assets/audio/пить.mp3';
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const DrinkList(),
                                                    //     ),
                                                    //   );
                                                    // } else if (transactions[
                                                    //             index]
                                                    //         .spot ==
                                                    //     7) {
                                                    //   // audioasset =
                                                    //   //     'assets/audio/рисовать.mp3';
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const DrawList(),
                                                    //     ),
                                                    //   );
                                                    // } else if (transactions[
                                                    //             index]
                                                    //         .spot ==
                                                    //     8) {
                                                    //   // audioasset =
                                                    //   //     'assets/audio/отдыхать.mp3';
                                                    //   Navigator.push(
                                                    //     context,
                                                    //     PageRouteBuilder(
                                                    //       transitionDuration:
                                                    //           Duration.zero,
                                                    //       pageBuilder: (_, __,
                                                    //               ___) =>
                                                    //           const RestList(),
                                                    //     ),
                                                    //   );
                                                    // }
                                                    ByteData bytes =
                                                        await rootBundle.load(
                                                            audioasset); //load sound from assets
                                                    Uint8List soundbytes = bytes
                                                        .buffer
                                                        .asUint8List(
                                                            bytes.offsetInBytes,
                                                            bytes
                                                                .lengthInBytes);
                                                    await player
                                                        .playBytes(soundbytes);
                                                  },
                                                  child: Draggable(
                                                    onDraggableCanceled:
                                                        (Velocity,
                                                            Offset) async {
                                                      audioasset =
                                                          transactions[index]
                                                              .audio!;

                                                      ByteData bytes =
                                                          await rootBundle.load(
                                                              audioasset); //load sound from assets
                                                      Uint8List soundbytes = bytes
                                                          .buffer
                                                          .asUint8List(
                                                              bytes
                                                                  .offsetInBytes,
                                                              bytes
                                                                  .lengthInBytes);
                                                      await player.playBytes(
                                                          soundbytes);
                                                    },
                                                    onDragStarted: () {
                                                      index1 = index;
                                                      setState(() {});
                                                    },
                                                    onDragCompleted: () async {
                                                      watch.conditions(
                                                          context,
                                                          index1,
                                                          index2,
                                                          transactions,
                                                          const ListTrialForKids(),
                                                          index3,
                                                          transactions,
                                                          Boxes
                                                              .getTransactions());

                                                      watchAudio.audioPlayer(
                                                        transactions,
                                                        index,
                                                        context,
                                                      );
                                                    },
                                                    childWhenDragging:
                                                        Container(
                                                      height: size.height / 5,
                                                      width: 111.1,
                                                      color: Colors.transparent,
                                                    ),
                                                    data: Colors.green,
                                                    feedback: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4.0),
                                                      child: Container(
                                                        width: size.width / 6,
                                                        height:
                                                            (size.height + 20) /
                                                                5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color:
                                                                Colors.white),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .asset(
                                                                    transactions[
                                                                            index]
                                                                        .image!,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        9,
                                                                    // width: ,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  )),
                                                              Text(
                                                                transactions[
                                                                        index]
                                                                    .text!,
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        26,
                                                                    color: Colors
                                                                        .black,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4.0),
                                                      child: Container(
                                                        width: size.width / 6,
                                                        height:
                                                            (size.height + 20) /
                                                                5,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color:
                                                                Colors.white),
                                                        child: Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .asset(
                                                                    transactions[
                                                                            index]
                                                                        .image!,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        9,
                                                                    // width: ,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  )),
                                                              Text(
                                                                transactions[
                                                                        index]
                                                                    .text!,
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        26,
                                                                    color: Colors
                                                                        .black,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                );
                              })),
                        );
                      })),
            ),
          ),
        ),
        bottomNavigationBar: BottomWidget(
          items: esasSehifeList,
          index1: index1,
          index2: index2,
          path: const ListTrialForKids(),
          index3: index3,
          array: items1,
          array2: esasSehifeList2,
          box: Boxes.getTransactions(),
        ),
      ),
      // draggedItems.length == 3 ?
      draggedItems.length == 3 && watch.selectedValueForCards == 0 ||
              draggedItems.length == 4 && watch.selectedValueForCards == 1 ||
              draggedItems.length == 5 && watch.selectedValueForCards == 2 ||
              draggedItems.length == 6 && watch.selectedValueForCards == 3
          ? const Center(child: Example())
          : const Center()

      // Center(child: showLottie ? Example() : Center())

      // : null
    ]);
  }
}

void reset(context, path) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      transitionDuration: Duration.zero,
      pageBuilder: (_, __, ___) => path,
    ),
  );
}
