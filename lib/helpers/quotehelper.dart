import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/quotemodel.dart';

class Quotehelper {
  Quotehelper._();

  static final Quotehelper quotehelper = Quotehelper._();

  Database? db;

  String dbname = "quotedb.db";
  String tablename = "quotes";
  String colid = "id";
  String colauthor = "author";
  String coldes = "quote";

  String lovetablename = 'lovetable';
  String colloveid = 'id';
  String colloveauthor = 'author';
  String collovequote = 'quote';

  String mixtablename = 'mixtable';
  String colmixid = 'id';
  String colmixauthor = 'author';
  String colmixquote = 'quote';

  String motablename = 'motable';
  String colmoid = 'id';
  String colmoauthor = 'author';
  String colmoquote = 'quote';

  Future<Database?> initdb() async {
    String databasepath = await getDatabasesPath();

    String path = join(databasepath, dbname);

    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      String query =
          'CREATE TABLE IF NOT EXISTS $tablename($colid TEXT PRIMARY KEY,$colauthor TEXT,$coldes TEXT);';

      String query1 =
          "CREATE TABLE IF NOT EXISTS $lovetablename($colloveid TEXT PRIMARY KEY,$colloveauthor TEXT,$collovequote TEXT);";

      String query2 =
          "CREATE TABLE IF NOT EXISTS $mixtablename($colmixid TEXT PRIMARY KEY,$colmixauthor TEXT,$colmixquote TEXT);";

      String query3 =
          "CREATE TABLE IF NOT EXISTS $motablename($colmoid TEXT PRIMARY KEY,$colmoauthor TEXT,$colmoquote TEXT);";

      await db.execute(query);

      await db.execute(query1);

      await db.execute(query2);

      await db.execute(query3);
    });
    return db;
  }
//------------------------------------------------------

  Future<int> insertdb(
      {required String id,
      required String author,
      required String quote}) async {
    db = await initdb();

    String query =
        'INSERT INTO $tablename($colid,$colauthor,$coldes)VALUES(?,?,?);';
    List args = [id, author, quote];

    return await db!.rawInsert(query, args);
  }

  Future<List<Quotemodel>> fetch() async {
    db = await initdb();

    String query = "SELECT * FROM $tablename";

    List data = await db!.rawQuery(query);
    print(data);
    List<Quotemodel> alldata = data.map((e) => Quotemodel.fromjson(e)).toList();
    print(alldata);
    return alldata;
  }

  deletall() async {
    db = await initdb();
    String querry = "DELETE FROM $tablename";

    return await db!.rawDelete(querry);
  }

//------------------------------------------------------
  Future<int> insertlovedb(
      {required String id,
      required String author,
      required String quote}) async {
    db = await initdb();

    String query =
        "INSERT INTO $lovetablename($colloveid,$colloveauthor,$collovequote)VALUES(?,?,?)";
    List args = [id, author, quote];

    return db!.rawInsert(query, args);
  }

  Future<List<Quotemodel>> fetchlovedb() async {
    db = await initdb();
    String query = "SELECT * FROM $lovetablename";

    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    List<Quotemodel> alldata = data.map((e) => Quotemodel.fromjson(e)).toList();
    return alldata;
  }

  deletalllove() async {
    db = await initdb();
    String querry = "DELETE FROM $lovetablename";

    return await db!.rawDelete(querry);
  }

//------------------------------------------------------
  Future<int> insertmixdb(
      {required String id,
      required String author,
      required String quote}) async {
    db = await initdb();

    String query =
        "INSERT INTO $mixtablename($colmixid,$colmixauthor,$colmixquote)VALUES(?,?,?)";
    List args = [id, author, quote];

    return db!.rawInsert(query, args);
  }

  Future<List<Quotemodel>> fetchmixdb() async {
    db = await initdb();
    String query = "SELECT * FROM $mixtablename";

    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    List<Quotemodel> alldata = data.map((e) => Quotemodel.fromjson(e)).toList();
    return alldata;
  }

  deletallmix() async {
    db = await initdb();
    String querry = "DELETE FROM $mixtablename";

    return await db!.rawDelete(querry);
  }

//------------------------------------------------------
  Future<int> insertmodb(
      {required String id,
      required String author,
      required String quote}) async {
    db = await initdb();

    String query =
        "INSERT INTO $motablename($colmoid,$colmoauthor,$colmoquote)VALUES(?,?,?)";
    List args = [id, author, quote];

    return db!.rawInsert(query, args);
  }

  Future<List<Quotemodel>> fetchmodb() async {
    db = await initdb();
    String query = "SELECT * FROM $motablename";

    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    List<Quotemodel> alldata = data.map((e) => Quotemodel.fromjson(e)).toList();
    return alldata;
  }

  deletallmo() async {
    db = await initdb();
    String querry = "DELETE FROM $motablename";

    return await db!.rawDelete(querry);
  }
//------------------------------------------------------

}
