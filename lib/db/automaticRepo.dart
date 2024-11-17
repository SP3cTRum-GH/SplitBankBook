import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/db/model.dart';

class AutomaticRepo extends ChangeNotifier{

  final Mydatabase _db;

  AutomaticRepo(this._db);

  //insert
   Future<int> insertMoney(BigInt money, String name, int day) {
    return _db.into(_db.automatic).insert(
        AutomaticCompanion.insert(money: money, name: name, day:day));
  }

  // delete 
  Future deleteAutomatic(int index) {
    return (_db.delete(_db.automatic)..where((t) => t.index.equals(index))).go();
  }
  
  // update
   Future updateAutomatic(int index, String name, BigInt money) {
    return (_db.update(_db.automatic)..where((t) => t.index.equals(index))).write(AutomaticCompanion(name: Value(name) ,money: Value(money)));
  }
   //select
  Stream<List<AutomaticData>> readAll(){
    return _db.select(_db.automatic).watch();
  }
}