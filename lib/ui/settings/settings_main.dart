import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/data/provider_for_cards.dart';
import 'package:kids_app/ui/create_item.dart';
import 'package:provider/provider.dart';

bool isCongratulated = true;

class SettingsMainScreen extends StatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  State<SettingsMainScreen> createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends State<SettingsMainScreen> {
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
          'Настройки',
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
            padding: const EdgeInsets.fromLTRB(16.0, 30, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Режим поощрения',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    const Text(
                      'Режим общения',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text(
                      'Панель',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CupertinoSwitch(
                      activeColor: Colors.blue,
                      value: isCongratulated,
                      onChanged: (value) {
                        setState(() {
                          isCongratulated = !isCongratulated;
                        });
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    CupertinoSwitch(
                      activeColor: Colors.blue,
                      value: true,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    CupertinoSwitch(
                      activeColor: Colors.blue,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 80, 0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Добавить карточку',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Редактирование',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          const Text(
                            'карточки',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                      InkWell(
                        onTap: () {
                          watch.showCardNumberPicker(context);
                        },
                        child: const Text(
                          'Количество карточек',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                        iconSize: 30,
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CreateItem()));
                        },
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          color: Color.fromARGB(255, 168, 117, 98),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    IconButton(
                        iconSize: 30,
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CreateItem()));
                        },
                        icon: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Color.fromARGB(255, 168, 117, 98),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 11,
                    ),
                    InkWell(
                      onTap: () {
                        watch.showCardNumberPicker(context);
                      },
                      child: Text(
                        watch.cardsNumber.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
