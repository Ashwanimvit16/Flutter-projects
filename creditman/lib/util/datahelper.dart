import 'dart:async';

import 'package:creditman/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


class Data_helper {
  static final Data_helper _instance = new Data_helper.internal();
  factory Data_helper() => _instance;
  final String columnid = "id";
  final String columnphone = "phone";
  final String columncredits = "credits";
  final String columnusername = "username";
  final String columnemail = "email";
  final String tableitem = "userdb";
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initdb();
    return _db;
  }

  Data_helper.internal();

  initdb() async {
    Directory documentdir = await getApplicationDocumentsDirectory();
    String path = join(documentdir.path, "user_db.db");
    var ourdb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourdb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableitem($columnid INTEGER PRIMARY KEY,$columnusername TEXT,$columnemail TEXT,$columncredits INT, $columnphone INT)");
        print("table is created");
  }
  //insertion
  Future<int> saveitems(Userinfo item) async {
    var client = await db;
    int res = await client.insert("$tableitem", item.toMap());
    return res;
  }
  //get
  Future<List> getitems() async {
    var client = await db;
    var result = await client.rawQuery("SELECT * FROM $tableitem ORDER BY $columnusername ASC ");
    return result.toList();
  }
  //COUNT THE ITEMS
  Future<int> countitem() async {
    var client = await db;
    return Sqflite.firstIntValue(
        await client.rawQuery("SELECT COUNT(*) FROM $tableitem"));
  }

  Future<Userinfo> getitem(int id) async{
    var client = await db;
    var result= await client.rawQuery("SELECT * FROM $tableitem WHERE $columnid=$id");
    return Userinfo.fromMap(result.first);
  }

  Future<int> deleteitem(int id) async{
    var client= await db;
    return await client.delete(tableitem,
    where: "$columnid = ?",whereArgs: [id]
    );
  }
    Future<int> updateitem(Userinfo item) async{
      var client = await db;
      return await client.update(tableitem,item.toMap(),where: "$columnid = ?",whereArgs: [item.id]);
    }
    Future close() async{
      var client= await db;
      return client.close();
    }
}
