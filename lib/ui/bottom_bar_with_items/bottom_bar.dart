import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kids_app/data/provider_for_audio_player.dart';
import 'package:kids_app/data/provider_for_audio_player.dart';
import 'package:kids_app/data/provider_for_cards.dart';
import 'package:kids_app/domain/entities/item_entity.dart';
import 'package:kids_app/ui/list_for_kids.dart';
import 'package:kids_app/ui/settings/settings_main.dart';
import 'package:kids_app/ui/splash_screen/splash_congratulate.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatefulWidget {
  int index1;
  int index2;
  int index3;
  List array;

  List items;
  Widget path;
  List array2;
  Box<ItemsEntity> box;
  BottomWidget({
    Key? key,
    required this.index1,
    required this.index2,
    required this.index3,
    required this.array,
    required this.items,
    required this.path,
    required this.array2,
    required this.box,
  }) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
// int index1 = 0;
// int index2 = 0;
  // int currentIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<CardsProvider>();
    final watchAudio = context.watch<AudioProvider>();

    var size = MediaQuery.of(context).size;

    return IndexedStack(children: [
      ValueListenableBuilder(
        valueListenable: widget.box.listenable(),
        builder: (context, Box<ItemsEntity> box, _) {
          final transactions = widget.box.values.toList().cast<ItemsEntity>();
          return Container(
              // padding: EdgeInsets.only(top: 40),
              color: const Color.fromARGB(255, 202, 193, 193),
              height: (size.height) / 4,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 10,
                    child: DragTarget<Color>(
                      builder: (context, candidateData, rejectedData) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(1.0, 4, 4, 4),
                          child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            itemCount: draggedItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              // widget.index1 = index;
                              return Draggable(
                                onDraggableCanceled: ((velocity, offset) async {
                                  if (draggedItems.length == 3) {
                                    watch.backCards();
                                    // for (var elem in draggedItems) {
                                    //   box.put(elem.spot, elem);
                                    // }
                                    draggedItems.clear();
                                    audioasset =
                                        'assets/audio/попробуй еще раз.mp3';
                                    ByteData bytes = await rootBundle.load(
                                        audioasset); //load sound from assets
                                    Uint8List soundbytes = bytes.buffer
                                        .asUint8List(bytes.offsetInBytes,
                                            bytes.lengthInBytes);
                                    await player.playBytes(soundbytes);
                                    id.clear();
                                    widget.index1 = 0;
                                    widget.index2 = 0;

                                    // index1 = 0;
                                    reset(context, widget.path);

                                    // setState(() {});
                                  }
                                }),
                                onDragCompleted: (() {
                                  if (draggedItems.isNotEmpty) {
                                    if (draggedItems[index4].spot > 18 &&
                                            draggedItems[index4].spot < 101 ||
                                        draggedItems[index4].spot > 106 &&
                                            draggedItems[index4].spot < 201 ||
                                        draggedItems[index4].spot > 205 &&
                                            draggedItems[index4].spot < 301 ||
                                        draggedItems[index4].spot > 306 &&
                                            draggedItems[index4].spot < 401 ||
                                        draggedItems[index4].spot > 406 &&
                                            draggedItems[index4].spot < 501 ||
                                        draggedItems[index4].spot > 504 &&
                                            draggedItems[index4].spot < 601 ||
                                        draggedItems[index4].spot > 602 &&
                                            draggedItems[index4].spot < 701) {
                                      MyCardsBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    }
                                    if (draggedItems[index4].spot < 11) {
                                      Boxes.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot > 10 &&
                                        draggedItems[index4].spot < 101) {
                                      EatBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot >
                                            100 &&
                                        draggedItems[index4].spot < 201) {
                                      PlayBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot >
                                            200 &&
                                        draggedItems[index4].spot < 301) {
                                      GoBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot >
                                            300 &&
                                        draggedItems[index4].spot < 401) {
                                      HygieneBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot >
                                            400 &&
                                        draggedItems[index4].spot < 501) {
                                      DrinkBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot >
                                            500 &&
                                        draggedItems[index4].spot < 601) {
                                      DrawBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    } else if (draggedItems[index4].spot >
                                            600 &&
                                        draggedItems[index4].spot < 701) {
                                      RestBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    }
                                    // box.put(elem.spot, elem);
                                    if (draggedItems[index4].id == 0 ||
                                        draggedItems[index4].id == 1) {
                                      EatBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      Boxes.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      PlayBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      GoBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      HygieneBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      DrinkBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      DrawBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      RestBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                      MyCardsBox.getTransactions().put(
                                          draggedItems[index4].spot,
                                          draggedItems[index4]);
                                    }
                                    // }
                                    if (draggedItems.isNotEmpty) {
                                      draggedItems.remove(draggedItems[index4]);
                                    }
                                    reset(context, widget.path);
                                  }
                                }),
                                onDragStarted: () {
                                  index4 = index;
                                },
                                // onDragCompleted: () {
                                //   null;
                                // },
                                childWhenDragging: Container(
                                  height: size.height / 5,
                                  width: 111.1,
                                  color: Colors.transparent,
                                ),
                                data: 10,
                                feedback: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Container(
                                    width: size.width / 6,
                                    height: (size.height + 20) / 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: draggedItems[index]
                                                          .image !=
                                                      null
                                                  ? Image.asset(
                                                      draggedItems[index]
                                                          .image!,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              9,
                                                      // width: ,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Image.memory(
                                                      draggedItems[index]
                                                          .fileImage!,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              9,
                                                      // width: ,
                                                      fit: BoxFit.contain,
                                                    )
                                              // Image.asset(
                                              //   draggedItems[index].image!,
                                              //   height: 45,
                                              //   // width: ,
                                              //   fit: BoxFit.contain,
                                              // )
                                              ),
                                          Text(
                                            draggedItems[index].text,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    26,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Container(
                                    width: size.width / 6,
                                    height: (size.height + 20) / 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: draggedItems[index]
                                                          .image !=
                                                      null
                                                  ? Image.asset(
                                                      draggedItems[index]
                                                          .image!,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              9,
                                                      // width: ,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Image.memory(
                                                      draggedItems[index]
                                                          .fileImage!,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              9,
                                                      // width: ,
                                                      fit: BoxFit.contain,
                                                    )),
                                          Text(
                                            draggedItems[index].text,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    26,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                        // : Container();
                      },
                      onWillAccept: (data) {
                        return true;
                      },

                      // onLeave: (data) {},
                      onAccept: (data) async {
                        if (isCongratulated) {
                          if (draggedItems.length == 2 &&
                                  watch.selectedValueForCards == 0 ||
                              draggedItems.length == 3 &&
                                  watch.selectedValueForCards == 1 ||
                              draggedItems.length == 4 &&
                                  watch.selectedValueForCards == 2 ||
                              draggedItems.length == 5 &&
                                  watch.selectedValueForCards == 3) {
                            if (animationIndex == 4) {
                              setState(() {
                                animationIndex = 1;
                                visible = true;
                              });
                            } else {
                              animationIndex++;
                              setState(() {
                                visible = true;
                                // currentIndex1 = 0;
                              });
                            }
                          }
                        }
                        // setState(() {
                        // });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: [
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 9,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 198, 132, 108),
                              border: Border.all(
                                  // width: 1.9,
                                  color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          child: IgnorePointer(
                            ignoring: isPlayed,
                            child: IconButton(
                                iconSize: 20,

                                // padding: EdgeInsets.only(bottom: 20, top: 10),
                                constraints: const BoxConstraints(),

                                // iconSize: 15,
                                onPressed: () {
                                  setState(() {
                                    isPlayed = true;
                                  });

                                  watchAudio
                                      .isPlayedFlag(draggedItems.length == 3
                                          ? player5
                                          : draggedItems.length == 4
                                              ? player6
                                              : draggedItems.length == 5
                                                  ? player7
                                                  : draggedItems.length == 6
                                                      ? player8
                                                      : player2);
                                  // if (draggedItems.length == 3 &&
                                  //     currentIndex == 2) {
                                  //   player.onPlayerCompletion.listen((event) {
                                  //     isPlayed = true;
                                  //     setState(() {});
                                  //   });
                                  // }
                                  // if (currentIndex == 2) {
                                  //   isPlayed = false;
                                  // }
                                  // isPlayed = !isPlayed;
                                  // setState(() {});
                                  // isPlayed = true;
                                  // if (isPlayed == false) {
                                  // player.onPlayerCompletion.listen((event) {
                                  // if (isPlayed == true) {

                                  // isPlayed = false;
                                  // setState(() {});
                                  watchAudio.playAudios();
                                  // currentIndex1 = 0;
                                  //  watchAudio.
                                  // setState(() {});
                                  // Future.delayed(
                                  //     Duration(
                                  //         milliseconds: draggedItems.length == 3
                                  //             ? 2000
                                  //             : draggedItems.length == 3
                                  //                 ? 4500
                                  //                 : draggedItems.length == 4
                                  //                     ? 5500
                                  //                     : draggedItems.length == 5
                                  //                         ? 6500
                                  //                         : draggedItems
                                  //                                     .length ==
                                  //                                 6
                                  //                             ? 7500
                                  //                             : 2500), () {
                                  //   isPlayed = false;
                                  //   currentIndex1 = 0;

                                  //   setState(() {});
                                  // });
                                },
                                icon: const Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.height / 9,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 198, 132, 108),
                              border: Border.all(
                                  // width: 1.9,
                                  color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: IconButton(
                                iconSize: 20,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  if (draggedItems.isNotEmpty) {
                                    for (var elem in draggedItems) {
                                      if (elem.spot > 18 && elem.spot < 101 ||
                                          elem.spot > 106 && elem.spot < 201 ||
                                          elem.spot > 205 && elem.spot < 301 ||
                                          elem.spot > 306 && elem.spot < 401 ||
                                          elem.spot > 406 && elem.spot < 501 ||
                                          elem.spot > 504 && elem.spot < 601 ||
                                          elem.spot > 602 && elem.spot < 701) {
                                        MyCardsBox.getTransactions()
                                            .put(elem.spot, elem);
                                      }
                                      if (elem.spot < 11) {
                                        Boxes.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 10 &&
                                          elem.spot < 101) {
                                        EatBox.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 100 &&
                                          elem.spot < 201) {
                                        PlayBox.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 200 &&
                                          elem.spot < 301) {
                                        GoBox.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 300 &&
                                          elem.spot < 401) {
                                        HygieneBox.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 400 &&
                                          elem.spot < 501) {
                                        DrinkBox.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 500 &&
                                          elem.spot < 601) {
                                        DrawBox.getTransactions()
                                            .put(elem.spot, elem);
                                      } else if (elem.spot > 600 &&
                                          elem.spot < 701) {
                                        RestBox.getTransactions()
                                            .put(elem.spot, elem);
                                      }
                                      // box.put(elem.spot, elem);
                                      if (elem.id == 0 || elem.id == 1) {
                                        EatBox.getTransactions()
                                            .put(elem.spot, elem);
                                        Boxes.getTransactions()
                                            .put(elem.spot, elem);
                                        PlayBox.getTransactions()
                                            .put(elem.spot, elem);
                                        GoBox.getTransactions()
                                            .put(elem.spot, elem);
                                        HygieneBox.getTransactions()
                                            .put(elem.spot, elem);
                                        DrinkBox.getTransactions()
                                            .put(elem.spot, elem);
                                        DrawBox.getTransactions()
                                            .put(elem.spot, elem);
                                        RestBox.getTransactions()
                                            .put(elem.spot, elem);
                                        MyCardsBox.getTransactions()
                                            .put(elem.spot, elem);
                                      }
                                    }
                                    // for (var elem in draggedItems) {
                                    //   box.put(elem.spot, elem);
                                    // }
                                    draggedItems.clear();
                                    id.clear();
                                    widget.index1 = 0;
                                    widget.index2 = 0;
                                    // index1 = 0;

                                    reset(context, widget.path);
                                  }

                                  // setState(() {});
                                },
                                icon: const Icon(
                                  Icons.subdirectory_arrow_left,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    ]);
  }
}
