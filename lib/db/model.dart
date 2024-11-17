import 'dart:ffi';

import 'package:drift/drift.dart';

//type - 0:salery , 1:automatic, 2:living, 3:nestegg
class Total extends Table {
  IntColumn get type => integer()(); 
  Int64Column get money => int64()();
}

class Automatic extends Table{
  IntColumn get index => integer().autoIncrement()();
  Int64Column get money => int64()();
  TextColumn get name => text()();
  IntColumn get day => integer()();
}

class Living extends Table{
  IntColumn get index => integer().autoIncrement()();
  IntColumn get type => integer()();
  TextColumn get name => text()();
  Int64Column get money => int64()();
}

class NestEgg extends Table{
  IntColumn get from => integer()();
  IntColumn get to => integer()();
  Int64Column get money => int64()();
}

class Salery extends Table{
  IntColumn get index => integer().autoIncrement()();
  IntColumn get saleryDay => integer()();
  Int64Column get salery => int64()();
}