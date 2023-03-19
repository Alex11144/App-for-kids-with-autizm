import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:kids_app/ui/list_for_kids.dart';
import 'package:kids_app/ui/lists/draw_list.dart';
import 'package:kids_app/ui/lists/eat_list.dart';
import 'package:kids_app/ui/lists/go_list.dart';

import 'api_handmade/api_for_categories.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
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
          'Галерея',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.2,
              child: const ListOfCategories(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.8,
              child: MaterialApp(
                initialRoute: '/W1',
                routes: {
                  '/W1': (context) => const ListOfItems(),
                  '/W2': (context) => const ListTrialForKids(),
                },
                debugShowCheckedModeBanner: false,
                home: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text('data'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var tileCount = ValueNotifier<int>(10);
var gallerySingle = ValueNotifier<List>(drawItems);

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(children: [
      Image.asset(
        "assets/images/images.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      ValueListenableBuilder<dynamic>(
        valueListenable: gallerySingle,
        builder: (context, dynamic value, widget) => AnimationLimiter(
          key: ValueKey(gallerySingle.value),
          child: IntrinsicGridView.vertical(
              // margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              columnCount: 6,
              horizontalSpace: 7,
              verticalSpace: 10,
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              // crossAxisSpacing: 6,
              // mainAxisSpacing: 6,
              // crossAxisCount: 6,
              // childAspectRatio: 1.1,
              children: List.generate(gallerySingle.value.length - 1, (index) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: 6,
                  duration: const Duration(milliseconds: 200),
                  position: index,
                  child: SlideAnimation(
                    horizontalOffset: 0,
                    verticalOffset: -50.0,
                    child: ScaleAnimation(
                      scale: 1,
                      child: FadeInAnimation(
                        child: Container(
                          // color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // tileCount.value--;
                              setState(() {});
                            },
                            child: Container(
                              width: size.width / 6,
                              height: (size.height + 20) / 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          gallerySingle.value[index].image,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9,
                                          // width: ,
                                          fit: BoxFit.contain,
                                        )),
                                    Text(
                                      gallerySingle.value[index].text,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400),
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
        ),
      ),
    ]);
  }
}

class ListOfCategories extends StatefulWidget {
  const ListOfCategories({super.key});

  @override
  State<ListOfCategories> createState() => _ListOfCategoriesState();
}

class _ListOfCategoriesState extends State<ListOfCategories> {
  int tappedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: galleryCategories.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 0.8),
                child: Material(
                  color: Colors.red,
                  elevation: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: tappedIndex == index
                          ? Color.fromARGB(172, 156, 216, 246)
                          : Color.fromARGB(255, 238, 177, 154),
                    ),
                    child: ListTile(
                      dense: true,
                      // visualDensity: VisualDensity(horizontal: 1.0, vertical: 1.0),
                      // tileColor: tappedIndex == index ? Colors.red : Colors.white,
                      selected: true,
                      selectedColor: Colors.white,
                      onTap: () {
                        setState(() {
                          tappedIndex = index;
                          gallerySingle.value = allLists[index];

                          // tileCount.value--;
                        });
                      },
                      // selectedTileColor: tappedIndex == index ? Colors.red : Colors.red,
                      // visualDensity: VisualDensity(horizontal: 0.5),
                      leading: Image.asset(
                        galleryCategories[index].image,
                        width: MediaQuery.of(context).size.width / 12,
                        height: MediaQuery.of(context).size.height / 9,
                        fit: BoxFit.fitWidth,
                      ),
                      title: Text(
                        galleryCategories[index].name,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
