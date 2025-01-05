import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class MoveLiving extends StatefulWidget {
  final SaleryData livingMoney;
  final List<TotalData> data;
  final PageController pc;
  final List<BigInt> editData;
  const MoveLiving({super.key, required this.data, required this.pc, required this.editData, required this.livingMoney});
  
  @override
  State<MoveLiving> createState() => _MoveLivingState();
}

class _MoveLivingState extends State<MoveLiving> {
  
  @override
  Widget build(BuildContext context) {
    BigInt sendMoney = widget.livingMoney.salery - widget.data[2].money;

    return Scaffold(
       appBar: AppBar(
        title: const Text("생활비통장으로 이체"),
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
              title: Padding(
                padding: const EdgeInsets.only(left: 10), 
                child: Expanded(
                  child: TextButton(
                    child: Text("$sendMoney원 생활비통장 이체"),
                    onPressed: () { //목표금액 - 현재 생활비통장금액
                      widget.editData[2] = sendMoney;
                      // update(0, totalData[0].money-BigInt.parse(sendLiving.text));
                      // update(2, totalData[2].money+BigInt.parse(sendLiving.text));
                      setState(() {
                      
                      });
                    },
                  )
                ),
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