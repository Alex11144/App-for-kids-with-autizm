import 'package:flutter/material.dart';
import 'package:kids_app/ui/gallery/gallery_main.dart';
import 'package:kids_app/ui/list_for_kids.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/zastavka.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(255, 142, 91, 72))),
                  height: (MediaQuery.of(context).size.height - 35) / 4,
                  width: (MediaQuery.of(context).size.width + 30) / 4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.white,
                          elevation: 5),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ListTrialForKids()));
                        // : null;
                        // watch.category
                        setState(() {});
                      },
                      child: const Text('Общение',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 19))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.5,
                            color: const Color.fromARGB(255, 142, 91, 72))),
                    height: (MediaQuery.of(context).size.height - 35) / 4,
                    width: (MediaQuery.of(context).size.width + 30) / 4,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.white,
                            elevation: 5),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyGallery()));
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => ListTrialForKids()));
                          // : null;
                          // watch.category
                          setState(() {});
                        },
                        child: const Text(
                          'Галерея',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 19),
                        )),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
