import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/db/model.dart';

class NestEggRepo extends ChangeNotifier{

  final Mydatabase _db;

  NestEggRepo(this._db);

  //insert
   Future<int> insertMoney(int from, int to, BigInt money) {
    return _db.into(_db.nestEgg).insert(
        NestEggCompanion.insert(from: from, to: to, money: money));
  }

  // delete 
  Future deleteTimeBoxing(BigInt money) {
    return (_db.delete(_db.nestEgg)..where((t) => t.money.equals(money))).go();
  }
  
   //select
  Stream<List<NestEggData>> readAll(){
    return _db.select(_db.nestEgg).watch();
  }
}