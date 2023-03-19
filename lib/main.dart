import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_app/data/provider_for_audio_player.dart';
import 'package:kids_app/data/provider_for_cards.dart';
import 'package:kids_app/domain/entities/item_entity.dart';
import 'package:kids_app/ui/create_item.dart';
import 'package:kids_app/ui/list_for_kids.dart';
import 'package:kids_app/ui/lists/eat_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemsEntityAdapter());
  await Hive.openBox<ItemsEntity>('items');
  await Hive.openBox<ItemsEntity>('eatItems');
  await Hive.openBox<ItemsEntity>('playItems');
  await Hive.openBox<ItemsEntity>('goItems');
  await Hive.openBox<ItemsEntity>('hygieneItems');
  await Hive.openBox<ItemsEntity>('drinkItems');
  await Hive.openBox<ItemsEntity>('drawItems');
  await Hive.openBox<ItemsEntity>('restItems');
  await Hive.openBox<ItemsEntity>('dragged');
  await Hive.openBox<ItemsEntity>('myCards');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CardsProvider()),
    ChangeNotifierProvider(create: (_) => AudioProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 2000,
          minWidth: 200,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      // initialRoute: "/",
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListTrialForKids(),
      routes: {
        '/CreateItem': (context) => const CreateItem(),
        '/main_screen': (context) => const ListTrialForKids(),
        '/eat': (context) => const EatList(),
      },
    );
  }
}
