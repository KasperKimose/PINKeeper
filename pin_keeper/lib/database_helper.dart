import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'models/creditcard.dart';

class DataBaseHelper {

  static final DataBaseHelper _instance = new DataBaseHelper.internal();

  factory DataBaseHelper()=> _instance;

  static Database _db;

  Future<Database> get db async{
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBaseHelper.internal();

  initDb() async{
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE Card(id INTEGER PRIMARY KEY, name TEXT)");
    print("Table created");
  }

  Future<int> saveCard(CreditCard card) async{
    var dbClient = await db;
    int res = await dbClient.insert("Card", card.toMap());
    return res;
  }

  Future<List<CreditCard>> getCards() async{
    var dbClient = await db;
    List<Map> list = await dbClient.query("Card");

    if(list.length > 0){
      return list.map((card) => new CreditCard.fromMap(card)).toList();
    }
    return null;
  }
}