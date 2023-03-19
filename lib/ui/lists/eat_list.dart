import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:kids_app/data/provider_for_audio_player.dart';
import 'package:kids_app/data/provider_for_cards.dart';

import 'package:kids_app/domain/entities/item_entity.dart';
import 'package:kids_app/ui/appBar_for_lists/app_bar_for_lists.dart';
import 'package:kids_app/ui/bottom_bar_with_items/bottom_bar.dart';
import 'package:kids_app/ui/list_for_kids.dart';
import 'package:kids_app/ui/splash_screen/splash_congratulate.dart';
import 'package:provider/provider.dart';

List items2 = [
  ItemsEntity(
      text: 'Мясо',
      id: 2,
      spot: 11,
      image: 'assets/images/мясо.jpg',
      audio: 'assets/audio/мясо.mp3'),
  ItemsEntity(
      text: 'Рис',
      id: 2,
      spot: 12,
      image: 'assets/images/рис.jpg',
      audio: 'assets/audio/рис.mp3'),
  ItemsEntity(
      text: 'Овощи',
      id: 2,
      spot: 13,
      image: 'assets/images/овощи.jpg',
      audio: 'assets/audio/овощи.mp3'),
  ItemsEntity(
      text: 'Выпечка',
      id: 2,
      spot: 14,
      image: 'assets/images/выпечка.jpeg',
      audio: 'assets/audio/выпечка.mp3'),
  ItemsEntity(
      text: 'Гречка',
      id: 2,
      spot: 15,
      image: 'assets/images/гречневая каша.jpg',
      audio: 'assets/audio/гречка.mp3'),
  ItemsEntity(
      text: 'Макароны',
      id: 2,
      spot: 16,
      image: 'assets/images/макароны.jpg',
      audio: 'assets/audio/макароны.mp3'),
  ItemsEntity(
      text: 'Фрукты',
      id: 2,
      spot: 17,
      image: 'assets/images/фрукты.webp',
      audio: 'assets/audio/фрукты.mp3'),
  ItemsEntity(
      text: 'Сладкое',
      id: 2,
      spot: 18,
      image: 'assets/images/сладкое.jpg',
      audio: 'assets/audio/сладкое.mp3'),
  ItemsEntity(
      text: '',
      id: 1000,
      spot: 100,
      image: 'assets/images/сладкое.jpg',
      audio: 'assets/audio/мясо.mp3'),
];
bool isFirstRunForEat = false;

class EatList extends StatefulWidget {
  const EatList({
    super.key,
  });

  @override
  State<EatList> createState() => _EatListState();
}

class _EatListState extends State<EatList> with SingleTickerProviderStateMixin {
  // final _formKeyScreen1 = GlobalKey<FormState>();
  // bool accepted = false;
  bool accepted2 = false;
  bool accepted3 = false;
  late AnimationController _animationController;

  var items = Boxes.getTransactions().values.toList();
  int currentIndex1 = 0;

  @override
  void initState() {
    super.initState();

    // if (isFirstRunForEat == false) {
    //   // for (var elem in DraggedItemsBox.getTransactions().values.toList()) {
    //   //   if (elem.spot > 10 && elem.spot < 101) {
    //   //     EatBox.getTransactions().put(elem.spot, elem);
    //   //   }
    //   // }

    // }
    // isFirstRunForEat = true;

    // EatBox.getTransactions().clear();
    // DraggedItemsBox.getTransactions().clear();
  }
// int currentIndex1 = 0;

  final transaction =
      EatBox.getTransactions().values.toList().cast<ItemsEntity>();
  List eatList2 = [...iWant, ...items2];

  int index1 = 0;
  int index2 = 0;
  static int index3 = 0;

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
            child: CustomAppBarForLists(
              header: 'Есть',
              path: const ListTrialForKids(),
            )),
        body: DragTarget<int>(
          builder: (context, candidateData, rejectedData) =>
              SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                      child: ValueListenableBuilder(
                          valueListenable:
                              EatBox.getTransactions().listenable(),
                          builder: (context, Box<ItemsEntity> box, _) {
                            final transactions = EatBox.getTransactions()
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  // physics: NeverScrollableScrollPhysics(),
                                  // shrinkWrap: true,
                                  // crossAxisSpacing: 6,
                                  // mainAxisSpacing: 6,
                                  // crossAxisCount: 6,
                                  // childAspectRatio: 1.1,
                                  children: List.generate(transactions.length,
                                      (index) {
                                    // id.add(index);
                                    // print(id);
                                    // index1 = index;
                                    // id.add(esasSehifeList[index].id);
                                    return AnimationConfiguration.staggeredGrid(
                                      columnCount: 6,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      position: index,
                                      child:
                                          //  index == transactions.length - 2
                                          //     ? SizedBox(
                                          //         width: size.width / 6,
                                          //         height: (size.height + 20) / 5,
                                          //         child: ScaleAnimation(
                                          //           child: FadeInAnimation(
                                          //             child: ElevatedButton(
                                          //                 style:
                                          //                     ElevatedButton.styleFrom(
                                          //                         backgroundColor:
                                          //                             Colors.white),
                                          //                 onPressed: () {},
                                          //                 child: Column(
                                          //                   children: [
                                          //                     Image.asset(
                                          //                       'assets/images/SCFK_2017_W.jpg',
                                          //                       height: 54,
                                          //                       width: 75,
                                          //                       fit: BoxFit.fitWidth,
                                          //                     ),
                                          //                     Text(
                                          //                       'My cards',
                                          //                       style: TextStyle(
                                          //                           color:
                                          //                               Colors.black),
                                          //                     )
                                          //                   ],
                                          //                 )),
                                          //           ),
                                          //         ),
                                          //       )
                                          // :
                                          index == transactions.length - 1
                                              ? SizedBox(
                                                  width: size.width / 6,
                                                  height:
                                                      (size.height + 50) / 5,
                                                  child: ScaleAnimation(
                                                    child: FadeInAnimation(
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white),
                                                          onPressed: () => watch
                                                              .showAlertDialog(
                                                                  context),
                                                          child: Image.asset(
                                                              'assets/images/plus_PNG106.png')),
                                                    ),
                                                  ),
                                                )
                                              : ScaleAnimation(
                                                  child: FadeInAnimation(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        if (transactions[index]
                                                                .audio !=
                                                            null) {
                                                          audioasset =
                                                              transactions[
                                                                      index]
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
                                                          await player
                                                              .playBytes(
                                                                  soundbytes);
                                                        } else {
                                                          await player.play(
                                                              audioasset =
                                                                  transactions[
                                                                          index]
                                                                      .fileAudio!,
                                                              isLocal: true);
                                                        }

                                                        // transactions[index]
                                                        //             .audio !=
                                                        //         null
                                                        //     ?

                                                        // transactions[
                                                        //         index]
                                                        //     .fileAudio;

                                                        // if (feedback1[index].id == 2 ||
                                                        //     feedback1[index].id == 3 ||
                                                        //     feedback1[index].id == 4 ||
                                                        //     feedback1[index].id == 5 ||
                                                        //     feedback1[index].id == 6) {
                                                        //   Navigator.push(
                                                        //     context,
                                                        //     PageRouteBuilder(
                                                        //       transitionDuration:
                                                        //           Duration.zero,
                                                        //       pageBuilder: (_, __, ___) =>
                                                        //           EatList(),
                                                        //     ),
                                                        //   );
                                                        //   setState(() {});
                                                        // }
                                                        // if (draggedItems.isNotEmpty) {
                                                        //   accepted = true;
                                                        // } else {
                                                        //   accepted = false;
                                                        // }
                                                        // if (esasSehifeList[0].id != 0 &&
                                                        //     esasSehifeList[0].id != 1) {
                                                        //   if (feedback1[0].id == 0 &&
                                                        //       feedback1[1].id == 1) {
                                                        //     feedback1.removeAt(0);
                                                        //     feedback1.removeAt(0);
                                                        //   }
                                                        // } else if (esasSehifeList[0].id !=
                                                        //     0) {
                                                        //   if (feedback1[0].id == 0) {
                                                        //     feedback1.removeAt(0);
                                                        //   }
                                                        // } else if (esasSehifeList[1].id !=
                                                        //     1) {
                                                        //   if (feedback1[0].id == 1 ||
                                                        //       feedback1[1].id == 1) {
                                                        //     feedback1.removeAt(1);
                                                        //   }
                                                        // }
                                                        // accepted = false;
                                                        // if (iWant.length == 1) {
                                                        //   setState(() {});
                                                        // }
                                                        // print(id);
                                                        // if (esasSehifeList[index].id == 2 ||
                                                        //     esasSehifeList[index].id ==
                                                        //         3 ||
                                                        //     esasSehifeList[index].id ==
                                                        //         4 ||
                                                        //     esasSehifeList[index].id ==
                                                        //         5 ||
                                                        //     esasSehifeList[index].id ==
                                                        //         6) {
                                                        //   Navigator.pushReplacement(
                                                        //     context,
                                                        //     PageRouteBuilder(
                                                        //       transitionDuration:
                                                        //           Duration.zero,
                                                        //       pageBuilder: (_, __, ___) =>
                                                        //           EatList(),
                                                        //     ),
                                                        //   );
                                                        //   setState(() {});
                                                        // }
                                                        // setState(() {});
                                                      },
                                                      child: Draggable(
                                                        onDragStarted: () {
                                                          // if (feedback[index].id == 1) {
                                                          //   Navigator.pushNamed(
                                                          //       context, '/CreateItem');
                                                          // }
                                                          // Navigator.pushNamed(
                                                          //     context, '/eat');
                                                          index1 = index;
                                                          setState(() {});
                                                        },
                                                        onDragCompleted:
                                                            () async {
                                                          // if (transactions[
                                                          //             index]
                                                          //         .audio !=
                                                          //     null) {
                                                          //   audioasset =
                                                          //       transactions[
                                                          //               index]
                                                          //           .audio!;
                                                          //   ByteData bytes =
                                                          //       await rootBundle
                                                          //           .load(
                                                          //               audioasset); //load sound from assets
                                                          //   Uint8List soundbytes = bytes
                                                          //       .buffer
                                                          //       .asUint8List(
                                                          //           bytes
                                                          //               .offsetInBytes,
                                                          //           bytes
                                                          //               .lengthInBytes);
                                                          //   await player
                                                          //       .playBytes(
                                                          //           soundbytes);
                                                          // } else {
                                                          //   await player.play(
                                                          //       audioasset =
                                                          //           transactions[
                                                          //                   index]
                                                          //               .fileAudio!,
                                                          //       isLocal: true);
                                                          // }
                                                          watch.conditions(
                                                              context,
                                                              index1,
                                                              index2,
                                                              transactions,
                                                              const EatList(),
                                                              index3,
                                                              transactions,
                                                              EatBox
                                                                  .getTransactions());
                                                          await watchAudio
                                                              .audioPlayer(
                                                            transactions,
                                                            index,
                                                            context,
                                                          );
                                                          // transactions[index]
                                                          //             .audio !=
                                                          //         null
                                                          //     ? audioasset =
                                                          //         transactions[
                                                          //                 index]
                                                          //             .audio!
                                                          //     : transactions[
                                                          //             index]
                                                          //         .fileAudio;
                                                          // ByteData bytes =
                                                          //     await rootBundle
                                                          //         .load(audioFile!
                                                          //             .path); //load sound from assets
                                                          // Uint8List soundbytes = bytes
                                                          //     .buffer
                                                          //     .asUint8List(
                                                          //         bytes
                                                          //             .offsetInBytes,
                                                          //         bytes
                                                          //             .lengthInBytes);
                                                          // await player
                                                          //     .playBytes(
                                                          //         soundbytes);
                                                          // setState(() {});
                                                          // Boxes.getTransactions()
                                                          //         .values
                                                          //         .toList()
                                                          //         .map((e) => e.id)
                                                          //         .toList()
                                                          //         .contains(
                                                          //             iWant[index].id ==
                                                          //                 0)
                                                          //     ? Boxes.getTransactions()
                                                          //         .delete(
                                                          //             iWant[index].id ==
                                                          //                 0)
                                                          //     : null;
                                                          // Boxes.getTransactions()
                                                          //         .values
                                                          //         .toList()
                                                          //         .map((e) => e.id)
                                                          //         .toList()
                                                          //         .contains(
                                                          //             iWant[index].id ==
                                                          //                 1)
                                                          //     ? Boxes.getTransactions()
                                                          //         .delete(
                                                          //             iWant[index].id ==
                                                          //                 1)
                                                          //     : null;
                                                          //  Boxes.getTransactions().containsKey(0) ?
                                                        },
                                                        onDraggableCanceled:
                                                            ((velocity,
                                                                offset) async {
                                                          if (transactions[
                                                                      index]
                                                                  .audio !=
                                                              null) {
                                                            audioasset =
                                                                transactions[
                                                                        index]
                                                                    .audio!;
                                                            ByteData bytes =
                                                                await rootBundle
                                                                    .load(
                                                                        audioasset); //load sound from assets
                                                            Uint8List soundbytes = bytes
                                                                .buffer
                                                                .asUint8List(
                                                                    bytes
                                                                        .offsetInBytes,
                                                                    bytes
                                                                        .lengthInBytes);
                                                            await player
                                                                .playBytes(
                                                                    soundbytes);
                                                          } else {
                                                            await player.play(
                                                                audioasset =
                                                                    transactions[
                                                                            index]
                                                                        .fileAudio!,
                                                                isLocal: true);
                                                          }
                                                          // print(transactions[
                                                          //         index]
                                                          //     .fileAudio!);
                                                          // transactions[index]
                                                          //             .audio !=
                                                          //         null
                                                          //     ? audioasset =
                                                          //         transactions[
                                                          //                 index]
                                                          //             .audio!
                                                          //     : audioasset =
                                                          //         transactions[
                                                          //                 index]
                                                          //             .fileAudio!;
                                                          // ByteData bytes =
                                                          //     await rootBundle.load(
                                                          //         audioasset); //load sound from assets
                                                          // Uint8List soundbytes = bytes
                                                          //     .buffer
                                                          //     .asUint8List(
                                                          //         bytes
                                                          //             .offsetInBytes,
                                                          //         bytes
                                                          //             .lengthInBytes);
                                                          // await player
                                                          //     .playBytes(
                                                          //         soundbytes);
                                                        }),
                                                        childWhenDragging:
                                                            Container(
                                                          height:
                                                              size.height / 5,
                                                          width: 111.1,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        data: Colors.green,
                                                        feedback: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4.0),
                                                          child: Container(
                                                            width:
                                                                size.width / 6,
                                                            height:
                                                                (size.height +
                                                                        20) /
                                                                    5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color: Colors
                                                                    .white),
                                                            child: Center(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child:
                                                                          //  transactions[index].image ==
                                                                          //         null
                                                                          // ? Image.file(transactions[index]
                                                                          //     .fileImage!)
                                                                          // :
                                                                          transactions[index].image != null
                                                                              ? Image.asset(
                                                                                  transactions[index].image!,
                                                                                  height: MediaQuery.of(context).size.height / 9, // width: ,
                                                                                  // width: ,
                                                                                  fit: BoxFit.contain,
                                                                                )
                                                                              : Image.memory(
                                                                                  transactions[index].fileImage!,
                                                                                  height: MediaQuery.of(context).size.height / 9, // width: ,
                                                                                  // width: ,
                                                                                  fit: BoxFit.contain,
                                                                                )),
                                                                  Text(
                                                                    transactions[
                                                                            index]
                                                                        .text!,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height /
                                                                                26,
                                                                        color: Colors
                                                                            .black,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 4.0),
                                                          child: Container(
                                                            width:
                                                                size.width / 6,
                                                            height:
                                                                (size.height +
                                                                        20) /
                                                                    5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color: Colors
                                                                    .white),
                                                            child: Center(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child: transactions[index].image !=
                                                                              null
                                                                          ? Image
                                                                              .asset(
                                                                              transactions[index].image!,
                                                                              height: MediaQuery.of(context).size.height / 9, // width: ,
                                                                              fit: BoxFit.contain,
                                                                            )
                                                                          : Image
                                                                              .memory(
                                                                              transactions[index].fileImage!,
                                                                              height: MediaQuery.of(context).size.height / 9, // width: ,
                                                                              fit: BoxFit.contain,
                                                                            )),
                                                                  Text(
                                                                    transactions[
                                                                            index]
                                                                        .text!,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height /
                                                                                26,
                                                                        color: Colors
                                                                            .black,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontWeight:
                                                                            FontWeight.w400),
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomWidget(
          items: transaction,
          index1: index1,
          index2: index2,
          path: const EatList(),
          index3: index3,
          array: items2,
          array2: eatList2,
          box: EatBox.getTransactions(),
        ),
      ),
      draggedItems.length == 3 && watch.selectedValueForCards == 0 ||
              draggedItems.length == 4 && watch.selectedValueForCards == 1 ||
              draggedItems.length == 5 && watch.selectedValueForCards == 2 ||
              draggedItems.length == 6 && watch.selectedValueForCards == 3
          ? const Center(child: Example())
          : const Center()
    ]);
  }

  // void reset() {
  //   Navigator.pushReplacement(
  //     context,
  //     PageRouteBuilder(
  //       transitionDuration: Duration.zero,
  //       pageBuilder: (_, __, ___) => EatList(),
  //     ),
  //   );
  // }
}
