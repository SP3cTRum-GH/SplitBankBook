import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/db/model.dart';

class SaleryRepo extends ChangeNotifier{

  final Mydatabase _db;

  SaleryRepo(this._db);

  //insert
   Future<int> insertMoney(int saleryDay, BigInt money) {
    return _db.into(_db.salery).insert(
      SaleryCompanion.insert(saleryDay: saleryDay, salery: money));
  }

  // update saleryDay
  Future updateSaleryDay(int index, int saleryDay) {
    return (_db.update(_db.salery)..where((t) => t.index.equals(index))).write(SaleryCompanion(saleryDay: Value(saleryDay)));
  }
  //update saleryMoney
  Future updateSaleryMoney(int index, BigInt money) {
    return (_db.update(_db.salery)..where((t) => t.index.equals(index))).write(SaleryCompanion(salery: Value(money)));
  }
  
  //select
  Stream<List<SaleryData>> readAll(){
    return _db.select(_db.salery).watch();
  }

   //select
  Future<List<SaleryData>> readauto(){
    final result = (_db.select(_db.salery)..where((t) => t.index.equals(2))).get();
    return result;
  }
}