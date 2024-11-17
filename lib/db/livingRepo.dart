import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/db/model.dart';

class LivingRepo extends ChangeNotifier{

  final Mydatabase _db;

  LivingRepo(this._db);

  //insert
   Future<int> insertMoney(int type, String name, BigInt money) {
    return _db.into(_db.living).insert(
        LivingCompanion.insert(type: type, name: name, money: money));
  }

  // delete 
  Future deleteLiving(BigInt money) {
    return (_db.delete(_db.living)..where((t) => t.money.equals(money))).go();
  }

  // update 
  Future updateLiving(int index, String name, int type, BigInt money) {
    return (_db.update(_db.living)..where((t) => t.index.equals(index))).write(LivingCompanion(type: Value(type), name:Value(name), money: Value(money)));
  }
  
   //select
  Stream<List<LivingData>> readAll(){
    return _db.select(_db.living).watch();
  }

  Stream<List<LivingData>> read(int idx){
    final result = (_db.select(_db.living)..where((t) => t.type.equals(idx))).watch();
    return result;
  }
}