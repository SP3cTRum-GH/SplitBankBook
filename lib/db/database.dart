import 'dart:io';

import 'package:split_bankbook/db/automaticRepo.dart';
import 'package:split_bankbook/db/livingRepo.dart';
import 'package:split_bankbook/db/model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:split_bankbook/db/nestEggRepo.dart';
import 'package:split_bankbook/db/saleryRepo.dart';
import 'package:split_bankbook/db/totalRepo.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Total,Automatic,Living,NestEgg,Salery])
class Mydatabase extends _$Mydatabase {
  Mydatabase._internal() : super(_openDb());
  Mydatabase() : super(_openDb());

  static final Mydatabase instance = Mydatabase._internal();
  @override
  int get schemaVersion => 1;

@override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await saleryRepo.insertMoney(0, BigInt.zero);
        await saleryRepo.insertMoney(0, BigInt.zero);
        await totalRepo.insertMoney(0, BigInt.zero);
        await totalRepo.insertMoney(1, BigInt.zero);
        await totalRepo.insertMoney(2, BigInt.zero);
        await totalRepo.insertMoney(3, BigInt.zero);
      },
      onUpgrade: (Migrator m, int from, int to) async {

      },
    );
  }

TotalRepo get totalRepo => TotalRepo(this);
AutomaticRepo get automaticRepo => AutomaticRepo(this);
LivingRepo get livingRepo => LivingRepo(this);
NestEggRepo get nestEggRepo => NestEggRepo(this);
SaleryRepo get saleryRepo => SaleryRepo(this);

}
LazyDatabase _openDb() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    print(dbFolder.path);
    return NativeDatabase.createInBackground(file);
  });
}