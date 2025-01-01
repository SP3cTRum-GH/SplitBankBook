import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class BonusCheck extends StatefulWidget {
  final List<TotalData> data;
  final PageController pc;
  final List<BigInt> editData;
  const BonusCheck({super.key, required this.data, required this.pc, required this.editData});
  
  @override
  State<BonusCheck> createState() => _BonusCheckState();
}

class _BonusCheckState extends State<BonusCheck> {
  @override
  Widget build(BuildContext context) {
    TextEditingController addMoney = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("보너스 확인"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child:Text("월급통장금액: ₩${widget.data[0].money + widget.editData[0] - widget.editData[1] - widget.editData[2] - widget.editData[3]}", style: TextStyle(fontSize: 21))
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10), 
              child: Row(
                children: [
                  Expanded(
                    child:TextField(
                      controller: addMoney,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '이체금액 입력',
                      ),
                    )
                  ),
                  TextButton(
                    child: const Text("원 추가하기"),
                    onPressed: () {
                      widget.editData[0]=(BigInt.parse(addMoney.text));
                      setState(() {
                        
                      });
                      //update(0,totalData[0].money+BigInt.parse(addMoney.text));
                    },  
                  )
                ]
              ),
            )
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