import 'dart:async';
import 'package:database/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


class Data_helper {
  static final Data_helper _instance = new Data_helper.internal();
  factory Data_helper() => _instance;
  final String columnid = "id";
  final String columnname = "username";
  final String columnpassword = "password";
  final String tableuser = "tablename";
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initdb();
    return _db;
  }

  Data_helper.internal();

  initdb() async {
    Directory documentdir = await getApplicationDocumentsDirectory();
    String path = join(documentdir.path, "maindb.db");
    var ourdb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourdb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableuser($columnid INTEGER PRIMARY KEY,$columnname TEXT,$columnpassword TEXT)");
  }

  Future<int> saveuser(User user) async {
    var client = await db;
    int res = await client.insert("$tableuser", user.tomap());
    return res;
  }

  Future<List> getalluser() async {
    var client = await db;
    var result = await client.rawQuery("SELECT * FROM $tableuser");
    return result.toList();
  }

  Future<int> countuser() async {
    var client = await db;
    return Sqflite.firstIntValue(
        await client.rawQuery("SELECT COUNT(*) FROM $tableuser"));
  }

  Future<User> getuser(int id) async{
    var client = await db;
    var result= await client.rawQuery("SELECT * FROM $tableuser WHERE $columnid=$id");
    return User.fromMap(result.first);
  }

  Future<int> deleteuser(int id) async{
    var client= await db;
    return await client.delete(tableuser,
    where: "$columnid = ?",whereArgs: [id]
    );
  }
    Future<int> updateuser(User user) async{
      var client = await db;
      return await client.update(tableuser,user.tomap(),where: "$columnid = ?",whereArgs: [user.id]);
    }
    Future close() async{
      var client= await db;
      return client.close();
    }
}
