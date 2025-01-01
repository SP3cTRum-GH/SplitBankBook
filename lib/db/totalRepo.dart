import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/db/model.dart';

class TotalRepo extends ChangeNotifier{

  final Mydatabase _db;

  TotalRepo(this._db);

  //insert
   Future<int> insertMoney(int type, BigInt money) {
    return _db.into(_db.total).insert(
      TotalCompanion.insert(type: type, money: money));
  }

  // update 
  Future updateMoney(int type, BigInt money) {
    return (_db.update(_db.total)..where((t) => t.type.equals(type))).write(TotalCompanion(money: Value(money)));
  }
  
  //delete
  Future deleteMoney(int type){
    return (_db.delete(_db.total)..where((t) => t.type.equals(type))).go();
  }
  
  //select
  Stream<List<TotalData>> readAll(){
    return _db.select(_db.total).watch();
  }

  Stream<List<TotalData>> readIndex(List<int> type){
    return (_db.select(_db.total)..where((t) => t.type.isIn(type))).watch();
  }
}