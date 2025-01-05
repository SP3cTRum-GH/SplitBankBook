import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class MoveNestEgg extends StatefulWidget {
  final List<TotalData> data;
  final PageController pc;
  final List<BigInt> editData;
  const MoveNestEgg({super.key, required this.data, required this.pc, required this.editData});
  
  @override
  State<MoveNestEgg> createState() => _MoveNestEggState();
}

class _MoveNestEggState extends State<MoveNestEgg> {
  Mydatabase db = Mydatabase.instance;

  Future update(int type, BigInt money){
    return db.totalRepo.updateMoney(type, money);
  }

  Future sendingNestEgg(BigInt money){
    return db.nestEggRepo.insertMoney(0, 3, money);
  }

  @override
  Widget build(BuildContext context) {
    BigInt sendMoney = widget.data[0].money + widget.editData[0] - widget.editData[1] - widget.editData[2] - widget.editData[3];
    return Scaffold(
       appBar: AppBar(
        title: const Text("비상금통장으로 이체"),
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
                child: Row(
                  children: [
                    Expanded(
                    child: TextButton(
                      child: Text("$sendMoney원 비상금통장 이체"),
                      onPressed: () {
                        widget.editData[3] = sendMoney;
                        // update(0, totalData[0].money-BigInt.parse(sendNestEgg.text));
                        // update(3, totalData[3].money+BigInt.parse(sendNestEgg.text));
                        // sendingNestEgg(BigInt.parse(sendNestEgg.text));
                        setState(() {
                        
                        });
                      },  
                    )
                      
                    ),
                  ],
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
                      print(BigInt.zero);
                      print(widget.data[1].money + widget.editData[1]);
                      print(widget.data[2].money + widget.editData[2]);
                      print(widget.data[3].money + widget.editData[3]);
                      print(widget.editData[3]);

                      update(0, BigInt.zero);
                      update(1, widget.data[1].money + widget.editData[1]);
                      update(2, widget.data[2].money + widget.editData[2]);
                      update(3, widget.data[3].money + widget.editData[3]);
                      if(widget.editData[3] != BigInt.zero){
                        sendingNestEgg(widget.editData[3]);
                      }
                      // update(0, widget.data[0].money);
                      // update(1, widget.data[1].money + widget.editData[1]);
                      // update(2, widget.data[2].money + widget.editData[2]);
                      // update(3, widget.data[3].money + widget.editData[3]);
                      // sendingNestEgg(widget.editData[3]);
                      Navigator.pop(context);
                    },
                    child: const Text("완료")
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