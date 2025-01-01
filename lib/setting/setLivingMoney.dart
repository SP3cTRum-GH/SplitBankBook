import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class SetLivingMoney extends StatefulWidget{
  const SetLivingMoney({super.key});
  
   @override
  State<SetLivingMoney> createState() => _SetLivingMoneyState();
}

class _SetLivingMoneyState extends State<SetLivingMoney>{
  Mydatabase db = Mydatabase.instance;

  Stream<List<SaleryData>> selectSalery(){
    return db.saleryRepo.readAll();
  }
  Future updateSalery(BigInt money){
    return db.saleryRepo.updateSaleryMoney(3, money);
  }
  
  @override
  Widget build(BuildContext context) {
    TextEditingController teCnt = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("월급액수 설정"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
              stream: selectSalery(), 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                else if(snapshot.hasError) {
                  return Expanded(child: Container());
                }
                else{
                  final salery = snapshot.data ?? [];
                  return Row(
                    children: [
                      const Text("현재 목표 생활비: "),
                      Text("${salery[2].salery} 원")
                    ],
                  );
                  
                }
              }
            ),
            Row(
              children: [
                Text("변경 목표 생활비: "),
                Expanded(
                  child: TextField(
                    controller: teCnt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '목표 생활비 입력',
                    ),
                  )
                )
              ],
            ),
            ElevatedButton(
              onPressed: () { 
                updateSalery(BigInt.parse(teCnt.text));
              },
              child: const Text("저장")
            )            
          ],
        )
      )
    );
  }
}