import 'dart:async';

import 'package:notodo/model/notodoitem.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


class Data_helper {
  static final Data_helper _instance = new Data_helper.internal();
  factory Data_helper() => _instance;
  final String columnid = "id";
  final String columnitemname = "itemname";
  final String columnDateCreated = "dateCreated";
  final String tableitem = "notodo";
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initdb();
    return _db;
  }

  Data_helper.internal();

  initdb() async {
    Directory documentdir = await getApplicationDocumentsDirectory();
    String path = join(documentdir.path, "nodo_db.db");
    var ourdb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourdb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableitem($columnid INTEGER PRIMARY KEY,$columnitemname TEXT,$columnDateCreated TEXT)");
        print("table is created");
  }
  //insertion
  Future<int> saveitems(Nodoitem item) async {
    var client = await db;
    int res = await client.insert("$tableitem", item.toMap());
    return res;
  }
  //get
  Future<List> getitems() async {
    var client = await db;
    var result = await client.rawQuery("SELECT * FROM $tableitem ORDER BY $columnitemname ASC ");
    return result.toList();
  }
  //COUNT THE ITEMS
  Future<int> countitem() async {
    var client = await db;
    return Sqflite.firstIntValue(
        await client.rawQuery("SELECT COUNT(*) FROM $tableitem"));
  }

  Future<Nodoitem> getitem(int id) async{
    var client = await db;
    var result= await client.rawQuery("SELECT * FROM $tableitem WHERE $columnid=$id");
    return Nodoitem.fromMap(result.first);
  }

  Future<int> deleteitem(int id) async{
    var client= await db;
    return await client.delete(tableitem,
    where: "$columnid = ?",whereArgs: [id]
    );
  }
    Future<int> updateitem(Nodoitem item) async{
      var client = await db;
      return await client.update(tableitem,item.toMap(),where: "$columnid = ?",whereArgs: [item.id]);
    }
    Future close() async{
      var client= await db;
      return client.close();
    }
}
