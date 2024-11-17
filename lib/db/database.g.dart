// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TotalTable extends Total with TableInfo<$TotalTable, TotalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TotalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<BigInt> money = GeneratedColumn<BigInt>(
      'money', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [type, money];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'total';
  @override
  VerificationContext validateIntegrity(Insertable<TotalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TotalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TotalData(
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}money'])!,
    );
  }

  @override
  $TotalTable createAlias(String alias) {
    return $TotalTable(attachedDatabase, alias);
  }
}

class TotalData extends DataClass implements Insertable<TotalData> {
  final int type;
  final BigInt money;
  const TotalData({required this.type, required this.money});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type'] = Variable<int>(type);
    map['money'] = Variable<BigInt>(money);
    return map;
  }

  TotalCompanion toCompanion(bool nullToAbsent) {
    return TotalCompanion(
      type: Value(type),
      money: Value(money),
    );
  }

  factory TotalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TotalData(
      type: serializer.fromJson<int>(json['type']),
      money: serializer.fromJson<BigInt>(json['money']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<int>(type),
      'money': serializer.toJson<BigInt>(money),
    };
  }

  TotalData copyWith({int? type, BigInt? money}) => TotalData(
        type: type ?? this.type,
        money: money ?? this.money,
      );
  TotalData copyWithCompanion(TotalCompanion data) {
    return TotalData(
      type: data.type.present ? data.type.value : this.type,
      money: data.money.present ? data.money.value : this.money,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TotalData(')
          ..write('type: $type, ')
          ..write('money: $money')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(type, money);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TotalData &&
          other.type == this.type &&
          other.money == this.money);
}

class TotalCompanion extends UpdateCompanion<TotalData> {
  final Value<int> type;
  final Value<BigInt> money;
  final Value<int> rowid;
  const TotalCompanion({
    this.type = const Value.absent(),
    this.money = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TotalCompanion.insert({
    required int type,
    required BigInt money,
    this.rowid = const Value.absent(),
  })  : type = Value(type),
        money = Value(money);
  static Insertable<TotalData> custom({
    Expression<int>? type,
    Expression<BigInt>? money,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (money != null) 'money': money,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TotalCompanion copyWith(
      {Value<int>? type, Value<BigInt>? money, Value<int>? rowid}) {
    return TotalCompanion(
      type: type ?? this.type,
      money: money ?? this.money,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (money.present) {
      map['money'] = Variable<BigInt>(money.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TotalCompanion(')
          ..write('type: $type, ')
          ..write('money: $money, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AutomaticTable extends Automatic
    with TableInfo<$AutomaticTable, AutomaticData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutomaticTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<BigInt> money = GeneratedColumn<BigInt>(
      'money', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
      'day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [index, money, name, day];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'automatic';
  @override
  VerificationContext validateIntegrity(Insertable<AutomaticData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {index};
  @override
  AutomaticData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutomaticData(
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}money'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day'])!,
    );
  }

  @override
  $AutomaticTable createAlias(String alias) {
    return $AutomaticTable(attachedDatabase, alias);
  }
}

class AutomaticData extends DataClass implements Insertable<AutomaticData> {
  final int index;
  final BigInt money;
  final String name;
  final int day;
  const AutomaticData(
      {required this.index,
      required this.money,
      required this.name,
      required this.day});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['index'] = Variable<int>(index);
    map['money'] = Variable<BigInt>(money);
    map['name'] = Variable<String>(name);
    map['day'] = Variable<int>(day);
    return map;
  }

  AutomaticCompanion toCompanion(bool nullToAbsent) {
    return AutomaticCompanion(
      index: Value(index),
      money: Value(money),
      name: Value(name),
      day: Value(day),
    );
  }

  factory AutomaticData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutomaticData(
      index: serializer.fromJson<int>(json['index']),
      money: serializer.fromJson<BigInt>(json['money']),
      name: serializer.fromJson<String>(json['name']),
      day: serializer.fromJson<int>(json['day']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'index': serializer.toJson<int>(index),
      'money': serializer.toJson<BigInt>(money),
      'name': serializer.toJson<String>(name),
      'day': serializer.toJson<int>(day),
    };
  }

  AutomaticData copyWith({int? index, BigInt? money, String? name, int? day}) =>
      AutomaticData(
        index: index ?? this.index,
        money: money ?? this.money,
        name: name ?? this.name,
        day: day ?? this.day,
      );
  AutomaticData copyWithCompanion(AutomaticCompanion data) {
    return AutomaticData(
      index: data.index.present ? data.index.value : this.index,
      money: data.money.present ? data.money.value : this.money,
      name: data.name.present ? data.name.value : this.name,
      day: data.day.present ? data.day.value : this.day,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutomaticData(')
          ..write('index: $index, ')
          ..write('money: $money, ')
          ..write('name: $name, ')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(index, money, name, day);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutomaticData &&
          other.index == this.index &&
          other.money == this.money &&
          other.name == this.name &&
          other.day == this.day);
}

class AutomaticCompanion extends UpdateCompanion<AutomaticData> {
  final Value<int> index;
  final Value<BigInt> money;
  final Value<String> name;
  final Value<int> day;
  const AutomaticCompanion({
    this.index = const Value.absent(),
    this.money = const Value.absent(),
    this.name = const Value.absent(),
    this.day = const Value.absent(),
  });
  AutomaticCompanion.insert({
    this.index = const Value.absent(),
    required BigInt money,
    required String name,
    required int day,
  })  : money = Value(money),
        name = Value(name),
        day = Value(day);
  static Insertable<AutomaticData> custom({
    Expression<int>? index,
    Expression<BigInt>? money,
    Expression<String>? name,
    Expression<int>? day,
  }) {
    return RawValuesInsertable({
      if (index != null) 'index': index,
      if (money != null) 'money': money,
      if (name != null) 'name': name,
      if (day != null) 'day': day,
    });
  }

  AutomaticCompanion copyWith(
      {Value<int>? index,
      Value<BigInt>? money,
      Value<String>? name,
      Value<int>? day}) {
    return AutomaticCompanion(
      index: index ?? this.index,
      money: money ?? this.money,
      name: name ?? this.name,
      day: day ?? this.day,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (money.present) {
      map['money'] = Variable<BigInt>(money.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutomaticCompanion(')
          ..write('index: $index, ')
          ..write('money: $money, ')
          ..write('name: $name, ')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }
}

class $LivingTable extends Living with TableInfo<$LivingTable, LivingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LivingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<BigInt> money = GeneratedColumn<BigInt>(
      'money', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [index, type, name, money];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'living';
  @override
  VerificationContext validateIntegrity(Insertable<LivingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {index};
  @override
  LivingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LivingData(
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}money'])!,
    );
  }

  @override
  $LivingTable createAlias(String alias) {
    return $LivingTable(attachedDatabase, alias);
  }
}

class LivingData extends DataClass implements Insertable<LivingData> {
  final int index;
  final int type;
  final String name;
  final BigInt money;
  const LivingData(
      {required this.index,
      required this.type,
      required this.name,
      required this.money});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['index'] = Variable<int>(index);
    map['type'] = Variable<int>(type);
    map['name'] = Variable<String>(name);
    map['money'] = Variable<BigInt>(money);
    return map;
  }

  LivingCompanion toCompanion(bool nullToAbsent) {
    return LivingCompanion(
      index: Value(index),
      type: Value(type),
      name: Value(name),
      money: Value(money),
    );
  }

  factory LivingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LivingData(
      index: serializer.fromJson<int>(json['index']),
      type: serializer.fromJson<int>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      money: serializer.fromJson<BigInt>(json['money']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'index': serializer.toJson<int>(index),
      'type': serializer.toJson<int>(type),
      'name': serializer.toJson<String>(name),
      'money': serializer.toJson<BigInt>(money),
    };
  }

  LivingData copyWith({int? index, int? type, String? name, BigInt? money}) =>
      LivingData(
        index: index ?? this.index,
        type: type ?? this.type,
        name: name ?? this.name,
        money: money ?? this.money,
      );
  LivingData copyWithCompanion(LivingCompanion data) {
    return LivingData(
      index: data.index.present ? data.index.value : this.index,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      money: data.money.present ? data.money.value : this.money,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LivingData(')
          ..write('index: $index, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('money: $money')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(index, type, name, money);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LivingData &&
          other.index == this.index &&
          other.type == this.type &&
          other.name == this.name &&
          other.money == this.money);
}

class LivingCompanion extends UpdateCompanion<LivingData> {
  final Value<int> index;
  final Value<int> type;
  final Value<String> name;
  final Value<BigInt> money;
  const LivingCompanion({
    this.index = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.money = const Value.absent(),
  });
  LivingCompanion.insert({
    this.index = const Value.absent(),
    required int type,
    required String name,
    required BigInt money,
  })  : type = Value(type),
        name = Value(name),
        money = Value(money);
  static Insertable<LivingData> custom({
    Expression<int>? index,
    Expression<int>? type,
    Expression<String>? name,
    Expression<BigInt>? money,
  }) {
    return RawValuesInsertable({
      if (index != null) 'index': index,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (money != null) 'money': money,
    });
  }

  LivingCompanion copyWith(
      {Value<int>? index,
      Value<int>? type,
      Value<String>? name,
      Value<BigInt>? money}) {
    return LivingCompanion(
      index: index ?? this.index,
      type: type ?? this.type,
      name: name ?? this.name,
      money: money ?? this.money,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (money.present) {
      map['money'] = Variable<BigInt>(money.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LivingCompanion(')
          ..write('index: $index, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('money: $money')
          ..write(')'))
        .toString();
  }
}

class $NestEggTable extends NestEgg with TableInfo<$NestEggTable, NestEggData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NestEggTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<int> from = GeneratedColumn<int>(
      'from', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<int> to = GeneratedColumn<int>(
      'to', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<BigInt> money = GeneratedColumn<BigInt>(
      'money', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [from, to, money];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nest_egg';
  @override
  VerificationContext validateIntegrity(Insertable<NestEggData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  NestEggData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NestEggData(
      from: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from'])!,
      to: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}money'])!,
    );
  }

  @override
  $NestEggTable createAlias(String alias) {
    return $NestEggTable(attachedDatabase, alias);
  }
}

class NestEggData extends DataClass implements Insertable<NestEggData> {
  final int from;
  final int to;
  final BigInt money;
  const NestEggData(
      {required this.from, required this.to, required this.money});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['from'] = Variable<int>(from);
    map['to'] = Variable<int>(to);
    map['money'] = Variable<BigInt>(money);
    return map;
  }

  NestEggCompanion toCompanion(bool nullToAbsent) {
    return NestEggCompanion(
      from: Value(from),
      to: Value(to),
      money: Value(money),
    );
  }

  factory NestEggData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NestEggData(
      from: serializer.fromJson<int>(json['from']),
      to: serializer.fromJson<int>(json['to']),
      money: serializer.fromJson<BigInt>(json['money']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'from': serializer.toJson<int>(from),
      'to': serializer.toJson<int>(to),
      'money': serializer.toJson<BigInt>(money),
    };
  }

  NestEggData copyWith({int? from, int? to, BigInt? money}) => NestEggData(
        from: from ?? this.from,
        to: to ?? this.to,
        money: money ?? this.money,
      );
  NestEggData copyWithCompanion(NestEggCompanion data) {
    return NestEggData(
      from: data.from.present ? data.from.value : this.from,
      to: data.to.present ? data.to.value : this.to,
      money: data.money.present ? data.money.value : this.money,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NestEggData(')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('money: $money')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(from, to, money);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NestEggData &&
          other.from == this.from &&
          other.to == this.to &&
          other.money == this.money);
}

class NestEggCompanion extends UpdateCompanion<NestEggData> {
  final Value<int> from;
  final Value<int> to;
  final Value<BigInt> money;
  final Value<int> rowid;
  const NestEggCompanion({
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.money = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NestEggCompanion.insert({
    required int from,
    required int to,
    required BigInt money,
    this.rowid = const Value.absent(),
  })  : from = Value(from),
        to = Value(to),
        money = Value(money);
  static Insertable<NestEggData> custom({
    Expression<int>? from,
    Expression<int>? to,
    Expression<BigInt>? money,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (money != null) 'money': money,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NestEggCompanion copyWith(
      {Value<int>? from,
      Value<int>? to,
      Value<BigInt>? money,
      Value<int>? rowid}) {
    return NestEggCompanion(
      from: from ?? this.from,
      to: to ?? this.to,
      money: money ?? this.money,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (from.present) {
      map['from'] = Variable<int>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<int>(to.value);
    }
    if (money.present) {
      map['money'] = Variable<BigInt>(money.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NestEggCompanion(')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('money: $money, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SaleryTable extends Salery with TableInfo<$SaleryTable, SaleryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _saleryDayMeta =
      const VerificationMeta('saleryDay');
  @override
  late final GeneratedColumn<int> saleryDay = GeneratedColumn<int>(
      'salery_day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _saleryMeta = const VerificationMeta('salery');
  @override
  late final GeneratedColumn<BigInt> salery = GeneratedColumn<BigInt>(
      'salery', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [index, saleryDay, salery];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'salery';
  @override
  VerificationContext validateIntegrity(Insertable<SaleryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    }
    if (data.containsKey('salery_day')) {
      context.handle(_saleryDayMeta,
          saleryDay.isAcceptableOrUnknown(data['salery_day']!, _saleryDayMeta));
    } else if (isInserting) {
      context.missing(_saleryDayMeta);
    }
    if (data.containsKey('salery')) {
      context.handle(_saleryMeta,
          salery.isAcceptableOrUnknown(data['salery']!, _saleryMeta));
    } else if (isInserting) {
      context.missing(_saleryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {index};
  @override
  SaleryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleryData(
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      saleryDay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}salery_day'])!,
      salery: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}salery'])!,
    );
  }

  @override
  $SaleryTable createAlias(String alias) {
    return $SaleryTable(attachedDatabase, alias);
  }
}

class SaleryData extends DataClass implements Insertable<SaleryData> {
  final int index;
  final int saleryDay;
  final BigInt salery;
  const SaleryData(
      {required this.index, required this.saleryDay, required this.salery});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['index'] = Variable<int>(index);
    map['salery_day'] = Variable<int>(saleryDay);
    map['salery'] = Variable<BigInt>(salery);
    return map;
  }

  SaleryCompanion toCompanion(bool nullToAbsent) {
    return SaleryCompanion(
      index: Value(index),
      saleryDay: Value(saleryDay),
      salery: Value(salery),
    );
  }

  factory SaleryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleryData(
      index: serializer.fromJson<int>(json['index']),
      saleryDay: serializer.fromJson<int>(json['saleryDay']),
      salery: serializer.fromJson<BigInt>(json['salery']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'index': serializer.toJson<int>(index),
      'saleryDay': serializer.toJson<int>(saleryDay),
      'salery': serializer.toJson<BigInt>(salery),
    };
  }

  SaleryData copyWith({int? index, int? saleryDay, BigInt? salery}) =>
      SaleryData(
        index: index ?? this.index,
        saleryDay: saleryDay ?? this.saleryDay,
        salery: salery ?? this.salery,
      );
  SaleryData copyWithCompanion(SaleryCompanion data) {
    return SaleryData(
      index: data.index.present ? data.index.value : this.index,
      saleryDay: data.saleryDay.present ? data.saleryDay.value : this.saleryDay,
      salery: data.salery.present ? data.salery.value : this.salery,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleryData(')
          ..write('index: $index, ')
          ..write('saleryDay: $saleryDay, ')
          ..write('salery: $salery')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(index, saleryDay, salery);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleryData &&
          other.index == this.index &&
          other.saleryDay == this.saleryDay &&
          other.salery == this.salery);
}

class SaleryCompanion extends UpdateCompanion<SaleryData> {
  final Value<int> index;
  final Value<int> saleryDay;
  final Value<BigInt> salery;
  const SaleryCompanion({
    this.index = const Value.absent(),
    this.saleryDay = const Value.absent(),
    this.salery = const Value.absent(),
  });
  SaleryCompanion.insert({
    this.index = const Value.absent(),
    required int saleryDay,
    required BigInt salery,
  })  : saleryDay = Value(saleryDay),
        salery = Value(salery);
  static Insertable<SaleryData> custom({
    Expression<int>? index,
    Expression<int>? saleryDay,
    Expression<BigInt>? salery,
  }) {
    return RawValuesInsertable({
      if (index != null) 'index': index,
      if (saleryDay != null) 'salery_day': saleryDay,
      if (salery != null) 'salery': salery,
    });
  }

  SaleryCompanion copyWith(
      {Value<int>? index, Value<int>? saleryDay, Value<BigInt>? salery}) {
    return SaleryCompanion(
      index: index ?? this.index,
      saleryDay: saleryDay ?? this.saleryDay,
      salery: salery ?? this.salery,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (saleryDay.present) {
      map['salery_day'] = Variable<int>(saleryDay.value);
    }
    if (salery.present) {
      map['salery'] = Variable<BigInt>(salery.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleryCompanion(')
          ..write('index: $index, ')
          ..write('saleryDay: $saleryDay, ')
          ..write('salery: $salery')
          ..write(')'))
        .toString();
  }
}

abstract class _$Mydatabase extends GeneratedDatabase {
  _$Mydatabase(QueryExecutor e) : super(e);
  $MydatabaseManager get managers => $MydatabaseManager(this);
  late final $TotalTable total = $TotalTable(this);
  late final $AutomaticTable automatic = $AutomaticTable(this);
  late final $LivingTable living = $LivingTable(this);
  late final $NestEggTable nestEgg = $NestEggTable(this);
  late final $SaleryTable salery = $SaleryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [total, automatic, living, nestEgg, salery];
}

typedef $$TotalTableCreateCompanionBuilder = TotalCompanion Function({
  required int type,
  required BigInt money,
  Value<int> rowid,
});
typedef $$TotalTableUpdateCompanionBuilder = TotalCompanion Function({
  Value<int> type,
  Value<BigInt> money,
  Value<int> rowid,
});

class $$TotalTableFilterComposer
    extends FilterComposer<_$Mydatabase, $TotalTable> {
  $$TotalTableFilterComposer(super.$state);
  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TotalTableOrderingComposer
    extends OrderingComposer<_$Mydatabase, $TotalTable> {
  $$TotalTableOrderingComposer(super.$state);
  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TotalTableTableManager extends RootTableManager<
    _$Mydatabase,
    $TotalTable,
    TotalData,
    $$TotalTableFilterComposer,
    $$TotalTableOrderingComposer,
    $$TotalTableCreateCompanionBuilder,
    $$TotalTableUpdateCompanionBuilder,
    (TotalData, BaseReferences<_$Mydatabase, $TotalTable, TotalData>),
    TotalData,
    PrefetchHooks Function()> {
  $$TotalTableTableManager(_$Mydatabase db, $TotalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TotalTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TotalTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> type = const Value.absent(),
            Value<BigInt> money = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TotalCompanion(
            type: type,
            money: money,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int type,
            required BigInt money,
            Value<int> rowid = const Value.absent(),
          }) =>
              TotalCompanion.insert(
            type: type,
            money: money,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TotalTableProcessedTableManager = ProcessedTableManager<
    _$Mydatabase,
    $TotalTable,
    TotalData,
    $$TotalTableFilterComposer,
    $$TotalTableOrderingComposer,
    $$TotalTableCreateCompanionBuilder,
    $$TotalTableUpdateCompanionBuilder,
    (TotalData, BaseReferences<_$Mydatabase, $TotalTable, TotalData>),
    TotalData,
    PrefetchHooks Function()>;
typedef $$AutomaticTableCreateCompanionBuilder = AutomaticCompanion Function({
  Value<int> index,
  required BigInt money,
  required String name,
  required int day,
});
typedef $$AutomaticTableUpdateCompanionBuilder = AutomaticCompanion Function({
  Value<int> index,
  Value<BigInt> money,
  Value<String> name,
  Value<int> day,
});

class $$AutomaticTableFilterComposer
    extends FilterComposer<_$Mydatabase, $AutomaticTable> {
  $$AutomaticTableFilterComposer(super.$state);
  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get day => $state.composableBuilder(
      column: $state.table.day,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AutomaticTableOrderingComposer
    extends OrderingComposer<_$Mydatabase, $AutomaticTable> {
  $$AutomaticTableOrderingComposer(super.$state);
  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get day => $state.composableBuilder(
      column: $state.table.day,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AutomaticTableTableManager extends RootTableManager<
    _$Mydatabase,
    $AutomaticTable,
    AutomaticData,
    $$AutomaticTableFilterComposer,
    $$AutomaticTableOrderingComposer,
    $$AutomaticTableCreateCompanionBuilder,
    $$AutomaticTableUpdateCompanionBuilder,
    (
      AutomaticData,
      BaseReferences<_$Mydatabase, $AutomaticTable, AutomaticData>
    ),
    AutomaticData,
    PrefetchHooks Function()> {
  $$AutomaticTableTableManager(_$Mydatabase db, $AutomaticTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AutomaticTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AutomaticTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> index = const Value.absent(),
            Value<BigInt> money = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> day = const Value.absent(),
          }) =>
              AutomaticCompanion(
            index: index,
            money: money,
            name: name,
            day: day,
          ),
          createCompanionCallback: ({
            Value<int> index = const Value.absent(),
            required BigInt money,
            required String name,
            required int day,
          }) =>
              AutomaticCompanion.insert(
            index: index,
            money: money,
            name: name,
            day: day,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AutomaticTableProcessedTableManager = ProcessedTableManager<
    _$Mydatabase,
    $AutomaticTable,
    AutomaticData,
    $$AutomaticTableFilterComposer,
    $$AutomaticTableOrderingComposer,
    $$AutomaticTableCreateCompanionBuilder,
    $$AutomaticTableUpdateCompanionBuilder,
    (
      AutomaticData,
      BaseReferences<_$Mydatabase, $AutomaticTable, AutomaticData>
    ),
    AutomaticData,
    PrefetchHooks Function()>;
typedef $$LivingTableCreateCompanionBuilder = LivingCompanion Function({
  Value<int> index,
  required int type,
  required String name,
  required BigInt money,
});
typedef $$LivingTableUpdateCompanionBuilder = LivingCompanion Function({
  Value<int> index,
  Value<int> type,
  Value<String> name,
  Value<BigInt> money,
});

class $$LivingTableFilterComposer
    extends FilterComposer<_$Mydatabase, $LivingTable> {
  $$LivingTableFilterComposer(super.$state);
  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$LivingTableOrderingComposer
    extends OrderingComposer<_$Mydatabase, $LivingTable> {
  $$LivingTableOrderingComposer(super.$state);
  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$LivingTableTableManager extends RootTableManager<
    _$Mydatabase,
    $LivingTable,
    LivingData,
    $$LivingTableFilterComposer,
    $$LivingTableOrderingComposer,
    $$LivingTableCreateCompanionBuilder,
    $$LivingTableUpdateCompanionBuilder,
    (LivingData, BaseReferences<_$Mydatabase, $LivingTable, LivingData>),
    LivingData,
    PrefetchHooks Function()> {
  $$LivingTableTableManager(_$Mydatabase db, $LivingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$LivingTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$LivingTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> index = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<BigInt> money = const Value.absent(),
          }) =>
              LivingCompanion(
            index: index,
            type: type,
            name: name,
            money: money,
          ),
          createCompanionCallback: ({
            Value<int> index = const Value.absent(),
            required int type,
            required String name,
            required BigInt money,
          }) =>
              LivingCompanion.insert(
            index: index,
            type: type,
            name: name,
            money: money,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LivingTableProcessedTableManager = ProcessedTableManager<
    _$Mydatabase,
    $LivingTable,
    LivingData,
    $$LivingTableFilterComposer,
    $$LivingTableOrderingComposer,
    $$LivingTableCreateCompanionBuilder,
    $$LivingTableUpdateCompanionBuilder,
    (LivingData, BaseReferences<_$Mydatabase, $LivingTable, LivingData>),
    LivingData,
    PrefetchHooks Function()>;
typedef $$NestEggTableCreateCompanionBuilder = NestEggCompanion Function({
  required int from,
  required int to,
  required BigInt money,
  Value<int> rowid,
});
typedef $$NestEggTableUpdateCompanionBuilder = NestEggCompanion Function({
  Value<int> from,
  Value<int> to,
  Value<BigInt> money,
  Value<int> rowid,
});

class $$NestEggTableFilterComposer
    extends FilterComposer<_$Mydatabase, $NestEggTable> {
  $$NestEggTableFilterComposer(super.$state);
  ColumnFilters<int> get from => $state.composableBuilder(
      column: $state.table.from,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get to => $state.composableBuilder(
      column: $state.table.to,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NestEggTableOrderingComposer
    extends OrderingComposer<_$Mydatabase, $NestEggTable> {
  $$NestEggTableOrderingComposer(super.$state);
  ColumnOrderings<int> get from => $state.composableBuilder(
      column: $state.table.from,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get to => $state.composableBuilder(
      column: $state.table.to,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<BigInt> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$NestEggTableTableManager extends RootTableManager<
    _$Mydatabase,
    $NestEggTable,
    NestEggData,
    $$NestEggTableFilterComposer,
    $$NestEggTableOrderingComposer,
    $$NestEggTableCreateCompanionBuilder,
    $$NestEggTableUpdateCompanionBuilder,
    (NestEggData, BaseReferences<_$Mydatabase, $NestEggTable, NestEggData>),
    NestEggData,
    PrefetchHooks Function()> {
  $$NestEggTableTableManager(_$Mydatabase db, $NestEggTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NestEggTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NestEggTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> from = const Value.absent(),
            Value<int> to = const Value.absent(),
            Value<BigInt> money = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NestEggCompanion(
            from: from,
            to: to,
            money: money,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int from,
            required int to,
            required BigInt money,
            Value<int> rowid = const Value.absent(),
          }) =>
              NestEggCompanion.insert(
            from: from,
            to: to,
            money: money,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NestEggTableProcessedTableManager = ProcessedTableManager<
    _$Mydatabase,
    $NestEggTable,
    NestEggData,
    $$NestEggTableFilterComposer,
    $$NestEggTableOrderingComposer,
    $$NestEggTableCreateCompanionBuilder,
    $$NestEggTableUpdateCompanionBuilder,
    (NestEggData, BaseReferences<_$Mydatabase, $NestEggTable, NestEggData>),
    NestEggData,
    PrefetchHooks Function()>;
typedef $$SaleryTableCreateCompanionBuilder = SaleryCompanion Function({
  Value<int> index,
  required int saleryDay,
  required BigInt salery,
});
typedef $$SaleryTableUpdateCompanionBuilder = SaleryCompanion Function({
  Value<int> index,
  Value<int> saleryDay,
  Value<BigInt> salery,
});

class $$SaleryTableFilterComposer
    extends FilterComposer<_$Mydatabase, $SaleryTable> {
  $$SaleryTableFilterComposer(super.$state);
  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get saleryDay => $state.composableBuilder(
      column: $state.table.saleryDay,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<BigInt> get salery => $state.composableBuilder(
      column: $state.table.salery,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SaleryTableOrderingComposer
    extends OrderingComposer<_$Mydatabase, $SaleryTable> {
  $$SaleryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get saleryDay => $state.composableBuilder(
      column: $state.table.saleryDay,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<BigInt> get salery => $state.composableBuilder(
      column: $state.table.salery,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$SaleryTableTableManager extends RootTableManager<
    _$Mydatabase,
    $SaleryTable,
    SaleryData,
    $$SaleryTableFilterComposer,
    $$SaleryTableOrderingComposer,
    $$SaleryTableCreateCompanionBuilder,
    $$SaleryTableUpdateCompanionBuilder,
    (SaleryData, BaseReferences<_$Mydatabase, $SaleryTable, SaleryData>),
    SaleryData,
    PrefetchHooks Function()> {
  $$SaleryTableTableManager(_$Mydatabase db, $SaleryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SaleryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SaleryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> index = const Value.absent(),
            Value<int> saleryDay = const Value.absent(),
            Value<BigInt> salery = const Value.absent(),
          }) =>
              SaleryCompanion(
            index: index,
            saleryDay: saleryDay,
            salery: salery,
          ),
          createCompanionCallback: ({
            Value<int> index = const Value.absent(),
            required int saleryDay,
            required BigInt salery,
          }) =>
              SaleryCompanion.insert(
            index: index,
            saleryDay: saleryDay,
            salery: salery,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SaleryTableProcessedTableManager = ProcessedTableManager<
    _$Mydatabase,
    $SaleryTable,
    SaleryData,
    $$SaleryTableFilterComposer,
    $$SaleryTableOrderingComposer,
    $$SaleryTableCreateCompanionBuilder,
    $$SaleryTableUpdateCompanionBuilder,
    (SaleryData, BaseReferences<_$Mydatabase, $SaleryTable, SaleryData>),
    SaleryData,
    PrefetchHooks Function()>;

class $MydatabaseManager {
  final _$Mydatabase _db;
  $MydatabaseManager(this._db);
  $$TotalTableTableManager get total =>
      $$TotalTableTableManager(_db, _db.total);
  $$AutomaticTableTableManager get automatic =>
      $$AutomaticTableTableManager(_db, _db.automatic);
  $$LivingTableTableManager get living =>
      $$LivingTableTableManager(_db, _db.living);
  $$NestEggTableTableManager get nestEgg =>
      $$NestEggTableTableManager(_db, _db.nestEgg);
  $$SaleryTableTableManager get salery =>
      $$SaleryTableTableManager(_db, _db.salery);
}
