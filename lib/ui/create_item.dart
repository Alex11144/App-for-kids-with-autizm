import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kids_app/domain/entities/item_entity.dart';
import 'package:kids_app/ui/list_for_kids.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../data/provider_for_cards.dart';

int index5 = 0;
File? imageFile;
File? audioFile;
List images = [];
Future<void> _showTakeOrChoosePhotoDialog(context, func1, func2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // <-- SEE HERE
        // title: Center(child: const Text('Create new ')),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Column(
                children: [
                  Column(
                    children: const [
                      Text('Чтобы добавить изображение'),
                      Text('выберите его из галереи'),
                      Text('мобильного устрйоства или'),
                      Text('сделайте новое фото. '),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(255, 142, 91, 72))),
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Colors.white,
                              elevation: 0),
                          onPressed: () {
                            func1;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Сделать фото фто',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 142, 91, 72)),
                              ),
                              Text(
                                'фотоыфыф',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 142, 91, 72)),
                              ),
                            ],
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(255, 142, 91, 72))),
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width / 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Colors.white,
                              elevation: 0),
                          onPressed: () {
                            func2;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Выбрать из',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 142, 91, 72)),
                              ),
                              Text(
                                'галереи',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 142, 91, 72)),
                              ),
                            ],
                          )))
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

class CreateItem extends StatefulWidget {
  const CreateItem({super.key});

  @override
  State<CreateItem> createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      print(imageFile!.path);
    }
    // print(imageFile!.path);
  }
// AudioPlayer player1 = AudioPlayer();

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    // TODO: implement dispose
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'microphone permisson not granted';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(Duration(milliseconds: 500));
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    audioFile = File(path!);

    print('$audioFile');
  }

  Future<void> showAlertDialogSoundRecorder(context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                // <-- SEE HERE
                title: const Center(child: Text('Добавить звук')),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Column(
                        children: [
                          Center(
                            child: ElevatedButton(
                              child: Icon(
                                  recorder.isRecording ? Icons.stop : Icons.mic,
                                  size: 40),
                              onPressed: () async {
                                if (recorder.isRecording) {
                                  await stop();
                                } else {
                                  await record();
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          StreamBuilder<RecordingDisposition>(
                              stream: recorder.onProgress,
                              builder: ((context, snapshot) {
                                final duration = snapshot.hasData
                                    ? snapshot.data!.duration
                                    : Duration.zero;

                                String twoDigits(int n) =>
                                    n.toString().padLeft(2, '0');
                                final twoDigitsMinutes =
                                    twoDigits(duration.inMinutes.remainder(60));
                                final twoDigitsSeconds =
                                    twoDigits(duration.inSeconds.remainder(60));
                                return Text(
                                    '$twoDigitsMinutes: $twoDigitsSeconds');
                              })),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 0.5,
                                      color: const Color.fromARGB(
                                          255, 142, 91, 72))),
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.width / 5,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: Colors.white,
                                      elevation: 0),
                                  onPressed: () async {
                                    // await playFunc();
                                    if (audioFile != null) {
                                      await player.play(
                                          audioasset = audioFile!.path,
                                          isLocal: true);
                                    }

                                    // ByteData bytes = await rootBundle.load(
                                    //     audioFile!
                                    //         .path); //load sound from assets
                                    // // Uint8List soundbytes = bytes.buffer
                                    // //     .asUint8List(bytes.offsetInBytes,
                                    // //         bytes.lengthInBytes);
                                    // await player.playBytes(audioFile!.readAsBytesSync());
                                    // await player.setUrl(
                                    //     'assets/audio/мелки.mp3',
                                    //     isLocal: true);
                                  },
                                  child: const Text(
                                    'Прослушать',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromARGB(255, 142, 91, 72)),
                                  ))),
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
        });
  }

  // Future<void> playFunc() async {
  //   recordingPlayer.open(
  //     Audio.file(audioFile!.path),
  //     autoStart: true,
  //     showNotification: true,
  //   );
  //   print(audioFile!.readAsBytesSync());
  //   print(audioFile!.path);
  // }

  String name = '';
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<CardsProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 230, 236, 188),
      appBar: AppBar(
        bottom: const PreferredSize(
            child: Divider(
              height: 4,
              thickness: 0.5,
            ),
            preferredSize: Size.fromHeight(4.0)),
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        backgroundColor: const Color.fromARGB(255, 230, 236, 188),
        centerTitle: true,
        title: const Text(
          'Создание своей карточки',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 14, 98, 166),
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                16.0, MediaQuery.of(context).size.height / 8, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return ListView(children: [
                              AlertDialog(
                                // scrollable: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),

                                content: ListBody(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          'Введите название карточки:',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                28,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              32,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                              4,
                                          child: TextField(
                                            scrollPadding:
                                                const EdgeInsets.all(0),
                                            scrollPhysics:
                                                const BouncingScrollPhysics(),
                                            controller:
                                                watch.nameTextController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  //Outline border type for TextFeild
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        46, 158, 158, 158),
                                                    // width: 0.5,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              55,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: const Color.fromARGB(
                                                        255, 142, 91, 72))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                    backgroundColor: Colors.white,
                                                    elevation: 0),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Назад',
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              21,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color.fromARGB(
                                                          255, 142, 91, 72)),
                                                ))),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              32,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: const Color.fromARGB(
                                                        255, 142, 91, 72))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  backgroundColor: Colors.white,
                                                  elevation: 0),
                                              onPressed: () {
                                                name = watch
                                                    .nameTextController.text;
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Text(
                                                'Добавить',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            21,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromARGB(
                                                        255, 142, 91, 72)),
                                              ),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]);
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 182, 124, 103),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Название карточки',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                    ),
                    InkWell(
                      onTap: (() {
                        showDialog<void>(
                          // barrierLabel: "",

                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              // <-- SEE HERE
                              // title: Center(child: const Text('Create new ')),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Чтобы добавить изображение',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    28,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              'выберите его из галереи',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    28,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              'мобильного устрйоства или',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    28,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              'сделайте новое фото. ',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    28,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              32,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: const Color.fromARGB(
                                                        255, 142, 91, 72))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                    backgroundColor: Colors.white,
                                                    elevation: 0),
                                                onPressed: () {
                                                  _getFromCamera();
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Сделать',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              21,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromARGB(
                                                              255,
                                                              142,
                                                              91,
                                                              72)),
                                                    ),
                                                    Text(
                                                      'фото',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              21,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromARGB(
                                                              255,
                                                              142,
                                                              91,
                                                              72)),
                                                    ),
                                                  ],
                                                ))),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              32,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: const Color.fromARGB(
                                                        255, 142, 91, 72))),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                    backgroundColor: Colors.white,
                                                    elevation: 0),
                                                onPressed: () {
                                                  _getFromGallery();
                                                  images.add(imageFile);
                                                  // print(images);
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Выбрать из',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              21,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromARGB(
                                                              255,
                                                              142,
                                                              91,
                                                              72)),
                                                    ),
                                                    Text(
                                                      'галереи',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              21,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromARGB(
                                                              255,
                                                              142,
                                                              91,
                                                              72)),
                                                    ),
                                                  ],
                                                )))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 182, 124, 103),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Добавить изображение',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                    ),
                    InkWell(
                      onTap: () => watch.showPicker(context),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: Color.fromARGB(255, 182, 124, 103),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Выберите категорию',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                    ),
                    InkWell(
                      onTap: () async {
                        showAlertDialogSoundRecorder(context);
                        setState(() {});
                        // print(EatBox.getTransactions()
                        //     .values
                        //     .toList()
                        //     .elementAt(EatBox.getTransactions()
                        //             .values
                        //             .toList()
                        //             .length -
                        //         2)
                        //     .spot);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.volume_up,
                            color: Color.fromARGB(255, 182, 124, 103),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 16,
                          ),
                          Text(
                            'Добавьте звук при выборе',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.volume_up,
                            color: Color.fromARGB(255, 182, 124, 103),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 16,
                          ),
                          Text(
                            'Добавьте второй звук',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 40, 80, 0),
                  child: ValueListenableBuilder(
                    valueListenable: EatBox.getTransactions().listenable(),
                    builder: (context, Box<ItemsEntity> box, _) {
                      final transactions = EatBox.getTransactions()
                          .values
                          .toList()
                          .cast<ItemsEntity>();
                      return Column(
                        children: [
                          imageFile == null
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 9,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2)),
                                )
                              : Container(
                                  child: Image.file(
                                    imageFile!,
                                    fit: BoxFit.fill,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 9,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2)),
                                ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Text(
                            watch.nameTextController.text.isNotEmpty
                                ? name
                                : 'Название',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            watch.category,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 21,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 0.5,
                                    color: const Color.fromARGB(
                                        255, 142, 91, 72))),
                            height: MediaQuery.of(context).size.height / 7,
                            width: (MediaQuery.of(context).size.width - 20) / 4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: Colors.white,
                                    elevation: 5),
                                onPressed: () {
                                  watch.addNewCard(context);
                                  // : null;
                                  // watch.category
                                  setState(() {});
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Сохранить',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                21,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      'карточку',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                21,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                )),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
