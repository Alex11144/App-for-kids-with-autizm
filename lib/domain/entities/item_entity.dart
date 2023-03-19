// import 'dart:html';

import 'dart:io';
import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'item_entity.g.dart';

@HiveType(typeId: 0)
class ItemsEntity {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? image;
  @HiveField(2)
  int? id;
  @HiveField(3)
  int spot;
  @HiveField(4)
  Uint8List? fileImage;
  @HiveField(5)
  String? audio;
  @HiveField(6)
  String? fileAudio;
  //   @HiveField(4)
  // int? yer;
  ItemsEntity(
      {this.text,
      this.image,
      this.id,
      required this.spot,
      this.fileImage,
      this.audio,
      this.fileAudio});
}

class Boxes {
  static Box<ItemsEntity> getTransactions() => Hive.box<ItemsEntity>('items');
}

class EatBox {
  static Box<ItemsEntity> getTransactions() =>
      Hive.box<ItemsEntity>('eatItems');
}

class PlayBox {
  static Box<ItemsEntity> getTransactions() =>
      Hive.box<ItemsEntity>('playItems');
}

class GoBox {
  static Box<ItemsEntity> getTransactions() => Hive.box<ItemsEntity>('goItems');
}

class HygieneBox {
  static Box<ItemsEntity> getTransactions() =>
      Hive.box<ItemsEntity>('hygieneItems');
}

class DrinkBox {
  static Box<ItemsEntity> getTransactions() =>
      Hive.box<ItemsEntity>('drinkItems');
}

class DrawBox {
  static Box<ItemsEntity> getTransactions() =>
      Hive.box<ItemsEntity>('drawItems');
}

class RestBox {
  static Box<ItemsEntity> getTransactions() =>
      Hive.box<ItemsEntity>('restItems');
}

class DraggedItemsBox {
  static Box<ItemsEntity> getTransactions() => Hive.box<ItemsEntity>('dragged');
}

class MyCardsBox {
  static Box<ItemsEntity> getTransactions() => Hive.box<ItemsEntity>('myCards');
}
