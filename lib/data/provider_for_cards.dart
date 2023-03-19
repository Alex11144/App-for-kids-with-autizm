// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_app/data/provider_for_audio_player.dart';
import 'package:kids_app/domain/entities/item_entity.dart';
import 'package:kids_app/ui/create_item.dart';
import 'package:kids_app/ui/list_for_kids.dart';

class CardsProvider extends ChangeNotifier {
  void SortedDraggedItems = [];
  CardsProvider() {
    print(draggedItems.length);
  }
  final transactions =
      Boxes.getTransactions().values.toList().cast<ItemsEntity>();
  List itemsCountList = [];
  List updateState = [...iWant, ...items1];

  // bubbleSort(List<dynamic> array) {
  //   int lengthOfArray = array.length;
  //   for (int i = 0; i < lengthOfArray - 1; i++) {
  //     for (int j = 0; j < lengthOfArray - i - 1; j++) {
  //       if (array[j] > array[j + 1]) {
  //         // Swapping using temporary variable
  //         var temp = array[j];
  //         array[j] = array[j + 1];
  //         array[j + 1] = temp;
  //       }
  //     }
  //   }
  //   return (array);
  // }

  // void updateState(List items, index1) {
  //   esasSehifeList.insert(index1, items[index1]);
  // }
  int selectedValue = 0;
  String category = 'Без категории';
  dynamic box = MyCardsBox.getTransactions();
  List categories = [
    'Без категории',
    'Есть',
    'Играть',
    'Пойти',
    'Гигиена',
    'Пить',
    'Рисовать',
    'Отдыхать',
  ];

  showPicker(context) {
    showModalBottomSheet(
        // backgroundColor: Colors.grey,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.transparent),
                      onPressed: () {
                        if (selectedValue == 0) {
                          box = MyCardsBox.getTransactions();
                        } else if (selectedValue == 1) {
                          box = EatBox.getTransactions();
                        } else if (selectedValue == 2) {
                          box = PlayBox.getTransactions();
                        } else if (selectedValue == 3) {
                          box = GoBox.getTransactions();
                        } else if (selectedValue == 4) {
                          box = HygieneBox.getTransactions();
                        } else if (selectedValue == 5) {
                          box = DrinkBox.getTransactions();
                        } else if (selectedValue == 6) {
                          box = DrawBox.getTransactions();
                        } else if (selectedValue == 7) {
                          box = RestBox.getTransactions();
                        } else {
                          box = EatBox.getTransactions();
                        }
                        category = categories[selectedValue];
                        // MyCardsBox.getTransactions().a
                        notifyListeners();
                        // });
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Принять',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: MediaQuery.of(context).size.height / 35,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: CupertinoPicker(
                      //           scrollController:FixedExtentScrollController(
                      //     parent: BouncingScrollPhysics(),
                      // ),
                      // useMagnifier: true,
                      // diameterRatio: 1,
                      // offAxisFraction: 1,
                      // squeeze: 1,
                      // magnification: 1.1,
                      looping: true,
                      backgroundColor: const Color.fromARGB(255, 239, 236, 236),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      itemExtent: 45.0,
                      children: categories
                          .map((e) => Center(
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void backCards() {
    for (var elem in draggedItems) {
      if (elem.spot > 18 && elem.spot < 101 ||
          elem.spot > 106 && elem.spot < 201 ||
          elem.spot > 205 && elem.spot < 301 ||
          elem.spot > 306 && elem.spot < 401 ||
          elem.spot > 406 && elem.spot < 501 ||
          elem.spot > 504 && elem.spot < 601 ||
          elem.spot > 602 && elem.spot < 701) {
        MyCardsBox.getTransactions().put(elem.spot, elem);
      }
      if (elem.spot == 0 || elem.spot == 1) {
        Boxes.getTransactions().put(elem.spot, elem);
        EatBox.getTransactions().put(elem.spot, elem);
        PlayBox.getTransactions().put(elem.spot, elem);
        GoBox.getTransactions().put(elem.spot, elem);
        HygieneBox.getTransactions().put(elem.spot, elem);
        DrinkBox.getTransactions().put(elem.spot, elem);
        DrawBox.getTransactions().put(elem.spot, elem);
        RestBox.getTransactions().put(elem.spot, elem);
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
      notifyListeners();
    }
  }

  int selectedValueForCards = 0;
  String cardsNumber = '3';
  List cardNumber = [3, 4, 5, 6];
  showCardNumberPicker(context) {
    showModalBottomSheet(
        // backgroundColor: Colors.grey,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.transparent),
                      onPressed: () {
                        cardsNumber =
                            cardNumber[selectedValueForCards].toString();
                        notifyListeners();

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Принять',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: MediaQuery.of(context).size.height / 35,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: CupertinoPicker(
                      //           scrollController:FixedExtentScrollController(
                      //     parent: BouncingScrollPhysics(),
                      // ),
                      // useMagnifier: true,
                      // diameterRatio: 1,
                      // offAxisFraction: 1,
                      // squeeze: 1,
                      // magnification: 1.1,
                      looping: false,
                      backgroundColor: const Color.fromARGB(255, 239, 236, 236),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          selectedValueForCards = value;
                        });
                      },
                      itemExtent: 45.0,
                      children: cardNumber
                          .map((e) => Center(
                                child: Text(e.toString()),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  // var images = imageFile!.();

  void addNewCard(context) async {
    if (nameTextController.text.isNotEmpty &&
        imageFile != null &&
        audioFile != null) {
      if (box != MyCardsBox.getTransactions()) {
        if (audioFile != null) {
          box.put(
              (box.values
                      .toList()
                      .elementAt((box.values.toList().length - 2))
                      .spot) +
                  1,
              ItemsEntity(
                  fileAudio: audioFile!.path,
                  // audio: 'assets/audio/предметы.mp3',
                  fileImage: imageFile!.readAsBytesSync(),
                  text: nameTextController.text,
                  id: 2,
                  spot: (box.values
                          .toList()
                          .elementAt((box.values.toList().length - 2))
                          .spot) +
                      1));
        }

        MyCardsBox.getTransactions().put(
            (box.values
                .toList()
                .elementAt((box.values.toList().length - 2))
                .spot),
            ItemsEntity(
                fileAudio: audioFile!.path,
                fileImage: imageFile!.readAsBytesSync(),
                text: nameTextController.text,
                id: 2,
                spot: (box.values
                    .toList()
                    .elementAt((box.values.toList().length - 2))
                    .spot)));
      }

      await showAlertDiaologForSavedCard(context);
      nameTextController.text = '';
      imageFile = null;
      selectedValue = 0;
      audioFile = null;
      category = categories[selectedValue];
      Navigator.pop(context);

      notifyListeners();
    } else {
      await showAlertDiaologForUnableToSaveCard(context);
      notifyListeners();
    }
  }

  void conditions(
      context, index1, index2, items, path, index3, array, box1) async {
    index3 = index1;
    isPlayer3 = false;
    notifyListeners();
    bool flag2 = false;
    if (draggedItems.isNotEmpty) {
      draggedItems.forEach((element) {
        if (element.id == items[index1].id) {
          if (itemsCountList.contains(element.spot) == false) {
            itemsCountList.add(element.spot);
          }
          return;
        }
      });
    }

    if (itemsCountList.length == 1 && selectedValueForCards == 0 ||
        itemsCountList.length == 2 && selectedValueForCards == 1 ||
        itemsCountList.length == 3 && selectedValueForCards == 2 ||
        itemsCountList.length == 4 && selectedValueForCards == 3) {
      player.stop();
      notifyListeners();
      currentIndex1 = 0;

      itemsCountList.clear();
      // currentIndex = 0;
      notifyListeners();
      // audioasset = 'assets/audio/попробуй еще раз.mp3';
      ByteData bytes =
          await rootBundle.load('assets/audio/попробуй еще раз.mp3');
      player1.stop();
      player2.stop();

      //load sound from assets
      Uint8List soundbytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      await player1.playBytes(soundbytes);
      notifyListeners();
      backCards();
      notifyListeners();
      // audioasset = 'assets/audio/попробуй еще раз.mp3';
      // ByteData bytes =
      //     await rootBundle.load(audioasset); //load sound from assets
      // Uint8List soundbytes =
      //     bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      // await player.playBytes(soundbytes);
      draggedItems.clear();

      id.clear();
      index1 = 0;
      flag2 = false;
      index2 = 0;
      // index1 = 0;
      reset(context, path);
      notifyListeners();
    } else {
      draggedItems.add(items[index1]);
      DraggedItemsBox.getTransactions().add(box1.values.toList()[index1]);
      for (var elem in draggedItems) {
        if (elem.spot < 11) {
          box1 = Boxes.getTransactions();
        } else if (elem.spot > 10 && elem.spot < 101) {
          box1 = EatBox.getTransactions();
        } else if (elem.spot > 100 && elem.spot < 201) {
          box1 = PlayBox.getTransactions();
        } else if (elem.spot > 200 && elem.spot < 301) {
          box1 = GoBox.getTransactions();
        } else if (elem.spot > 300 && elem.spot < 401) {
          box1 = HygieneBox.getTransactions();
        } else if (elem.spot > 400 && elem.spot < 501) {
          box1 = DrinkBox.getTransactions();
        } else if (elem.spot > 500 && elem.spot < 601) {
          box1 = DrawBox.getTransactions();
        } else if (elem.spot > 600 && elem.spot < 701) {
          box1 = RestBox.getTransactions();
        }
      }
      box1.delete(items[index1].spot);
      MyCardsBox.getTransactions().delete(items[index1].spot);
      notifyListeners();
    }

    draggedItems.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
    if (box1.values.toList().first.spot != 0 &&
        box1.values.toList()[0].spot != 1) {
      EatBox.getTransactions().delete(draggedItems[1].spot);
      EatBox.getTransactions().delete(draggedItems[0].spot);
      Boxes.getTransactions().delete(draggedItems[1].spot);
      Boxes.getTransactions().delete(draggedItems[0].spot);
      PlayBox.getTransactions().delete(draggedItems[1].spot);
      PlayBox.getTransactions().delete(draggedItems[0].spot);
      GoBox.getTransactions().delete(draggedItems[1].spot);
      GoBox.getTransactions().delete(draggedItems[0].spot);
      HygieneBox.getTransactions().delete(draggedItems[1].spot);
      HygieneBox.getTransactions().delete(draggedItems[0].spot);
      DrinkBox.getTransactions().delete(draggedItems[1].spot);
      DrinkBox.getTransactions().delete(draggedItems[0].spot);
      DrawBox.getTransactions().delete(draggedItems[1].spot);
      DrawBox.getTransactions().delete(draggedItems[0].spot);
      RestBox.getTransactions().delete(draggedItems[1].spot);
      RestBox.getTransactions().delete(draggedItems[0].spot);
      MyCardsBox.getTransactions().delete(draggedItems[1].spot);
      MyCardsBox.getTransactions().delete(draggedItems[0].spot);
    } else if (box1.values.toList().first.spot == 0 &&
        box1.values.toList()[1].spot != 1) {
      EatBox.getTransactions().delete(draggedItems[0].spot);
      Boxes.getTransactions().delete(draggedItems[0].spot);
      PlayBox.getTransactions().delete(draggedItems[0].spot);
      GoBox.getTransactions().delete(draggedItems[0].spot);
      HygieneBox.getTransactions().delete(draggedItems[0].spot);
      DrinkBox.getTransactions().delete(draggedItems[0].spot);
      DrawBox.getTransactions().delete(draggedItems[0].spot);
      RestBox.getTransactions().delete(draggedItems[0].spot);
      MyCardsBox.getTransactions().delete(draggedItems[0].spot);
    } else if (box1.values.toList()[0].spot == 1 &&
        box1.values.toList().first.spot != 0) {
      EatBox.getTransactions().delete(draggedItems[0].spot);
      Boxes.getTransactions().delete(draggedItems[0].spot);
      PlayBox.getTransactions().delete(draggedItems[0].spot);
      GoBox.getTransactions().delete(draggedItems[0].spot);
      HygieneBox.getTransactions().delete(draggedItems[0].spot);
      DrinkBox.getTransactions().delete(draggedItems[0].spot);
      DrawBox.getTransactions().delete(draggedItems[0].spot);
      RestBox.getTransactions().delete(draggedItems[0].spot);
      MyCardsBox.getTransactions().delete(draggedItems[0].spot);
    }
    notifyListeners();
  }

  Future<void> showAlertDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // <-- SEE HERE
          title: const Center(child: Text('Create new ')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 0.5,
                                color: const Color.fromARGB(255, 142, 91, 72))),
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Colors.white,
                                elevation: 0),
                            onPressed: () {},
                            child: const Text(
                              'Category',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 142, 91, 72)),
                            ))),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 0.5,
                                color: const Color.fromARGB(255, 142, 91, 72))),
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Colors.white,
                                elevation: 0),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/CreateItem');
                            },
                            child: const Text(
                              'Card',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 142, 91, 72)),
                            )))
                  ],
                )
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('No'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   TextButton(
          //     child: const Text('Yes'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  Future<void> showAlertDiaologForUnableToSaveCard(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // <-- SEE HERE
          title: const Center(child: Text('Ошибка при сохранении')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    const Text('Не указано название карточки'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Не выбрано фото'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Не записан звук'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Не добавлена вторая версия озвучания'),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(255, 142, 91, 72))),
                  height: MediaQuery.of(context).size.height / 7,
                  width: (MediaQuery.of(context).size.width - 20) / 8,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.white,
                          elevation: 5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Исправить',
                        style: TextStyle(color: Colors.black),
                      )),
                  // SizedBox(
                  //   height: 15,
                  // ),
                )
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('No'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   TextButton(
          //     child: const Text('Yes'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  TextEditingController nameTextController = TextEditingController();

  Future<void> showAlertDiaologForSavedCard(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // <-- SEE HERE
          title: const Center(child: Text('Карточка сохранена')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(255, 142, 91, 72))),
                  height: MediaQuery.of(context).size.height / 7,
                  width: (MediaQuery.of(context).size.width - 20) / 4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.white,
                          elevation: 5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Закрыть',
                          style: TextStyle(color: Colors.black))),
                  // SizedBox(
                  //   height: 15,
                  // ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
