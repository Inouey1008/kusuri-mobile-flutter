import 'dart:io';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseFactory {
  DatabaseFactory();

  static late final Database _instance;
  static Database get instance => _instance;

  static Future<void> setup() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}/kusuri.db';

    final exists = await databaseExists(path);
    if (exists) {
      Logger().i("Existing database deleted");
      await deleteDatabase(path);
    }

    ByteData data = await rootBundle.load('assets/database/kusuri.db');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(path).writeAsBytes(bytes, flush: true);
    DatabaseFactory._instance = await openDatabase(path);
  }
}
