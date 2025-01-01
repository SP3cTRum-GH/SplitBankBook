import 'package:flutter/material.dart';
import 'package:split_bankbook/banksplit/bonusCheck.dart';
import 'package:split_bankbook/banksplit/moveAuto.dart';
import 'package:split_bankbook/banksplit/moveLiving.dart';
import 'package:split_bankbook/banksplit/moveNestEgg.dart';
import 'package:split_bankbook/db/database.dart';

class BanksplitStepView extends StatefulWidget {
  List<TotalData> data = [];
  List<SaleryData> settingData = [];
  BanksplitStepView({super.key, required this.data, required this.settingData});

  @override
  State<BanksplitStepView> createState() => _BanksplitViewPageState();
}

class _BanksplitViewPageState extends State<BanksplitStepView> {
  List<SaleryData> settingData = [];
  List<TotalData> data = [];
  List<BigInt> editData= [BigInt.zero,BigInt.zero,BigInt.zero,BigInt.zero];
  PageController pc = PageController(initialPage: 0);

  @override
  void initState() {
    data = widget.data;
    settingData = widget.settingData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pc,
      children: [
        //view 넣기
        BonusCheck(data: data, pc: pc, editData:editData),
        MoveAuto(data: data, pc: pc, editData:editData, autoMoney: settingData[0]),
        MoveLiving(data: data, pc: pc, editData:editData, livingMoney: settingData[1]),
        MoveNestEgg(data: data, pc: pc, editData:editData)
      ],
    );
  }
}