import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class MoveAuto extends StatefulWidget {
  final SaleryData autoMoney;
  final List<TotalData> data;
  final PageController pc;
  final List<BigInt> editData;
  const MoveAuto({super.key, required this.data, required this.pc, required this.editData, required this.autoMoney});
  
  @override
  State<MoveAuto> createState() => _MoveAutoState();
}

class _MoveAutoState extends State<MoveAuto> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("자동이체통장으로 이체"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            widget.pc.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
          },
        ),
      ),
      body: Column(
        children: [
          Card(
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child:Text("현재금액: ${widget.data[0].money + widget.editData[0] - widget.editData[1] - widget.editData[2] - widget.editData[3]}", style: TextStyle(fontSize: 21))
              ),
            ),
            ListTile(
              title: Padding( // steam형 future형으로 바꿀것
                padding: const EdgeInsets.only(left: 10), 
                child: TextButton(
                  child: const Text("자동이체통장 이체"),
                  onPressed: () {
                    widget.editData[1] = widget.autoMoney.salery - widget.data[1].money;
                    setState(() {
                      
                    });
                    // List<SaleryData> autoData = await selectSalery();
                    // autoMoney = autoData[0].salery;

                    // print(autoMoney);
                    // update(0, totalData[0].money - autoMoney);
                    // update(1, totalData[1].money + autoMoney);
                  },
                )
              ),
            ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      widget.pc.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    child: const Text("다음")
                  )
                )
              )
            ],
          )
        ],
      )
    );
  }
}