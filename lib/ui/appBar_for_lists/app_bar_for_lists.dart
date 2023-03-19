// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kids_app/ui/list_for_kids.dart';
import 'package:kids_app/ui/settings/settings_main.dart';

class CustomAppBarForLists extends StatefulWidget {
  String header;
  Widget path;
  CustomAppBarForLists({
    Key? key,
    required this.header,
    required this.path,
  }) : super(key: key);

  @override
  State<CustomAppBarForLists> createState() => _CustomAppBarForListsState();
}

class _CustomAppBarForListsState extends State<CustomAppBarForLists> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  builder: (context) => SettingsMainScreen()));
            },
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsMainScreen()));
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
      title: Text(
        widget.header,
        style: TextStyle(color: Colors.black, fontSize: 22),
      ),
      leading: IconButton(
          onPressed: () {
            reset(context, widget.path);
            // Navigator.pop(context);
            // Navigator.of(context).pushReplacement(PageRouteBuilder(
            //   pageBuilder: (context, animation, secondaryAnimation) =>
            //       const MainMenu(),
            //   transitionsBuilder:
            //       (context, animation, secondaryAnimation, child) {
            //     final tween = Tween(begin: 0.0, end: 1.0);
            //     final fadeAnimation = animation.drive(tween);
            //     return FadeTransition(
            //       opacity: fadeAnimation,
            //       child: child,
            //     );
            //   },
            // ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 14, 98, 166),
          )),
      elevation: 0,
      // backgroundColor: Colors.transparent,
    );
  }
}
