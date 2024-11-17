import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class SetSaleryDay extends StatefulWidget{
  const SetSaleryDay({super.key});
  
   @override
  State<SetSaleryDay> createState() => _SetSaleryDayState();
}

class _SetSaleryDayState extends State<SetSaleryDay>{
  Mydatabase db = Mydatabase.instance;

  Stream<List<SaleryData>> selectSaleryDay(){
    return db.saleryRepo.readAll();
  }
  Future updateSaleryDay(int saleryDay){
    return db.saleryRepo.updateSaleryDay(1, saleryDay);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController teCnt = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("월급날 설정"),
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
              stream: selectSaleryDay(), 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                else if(snapshot.hasError) {
                  return Expanded(child: Container());
                }
                else{
                  final saleryDay = snapshot.data ?? [];
                  return Row(
                    children: [
                      Text("현재 월급날: "),
                      Text("${saleryDay[0].saleryDay} 일")
                    ],
                  );
                  
                }
              }
            ),
            Row(
              children: [
                Text("변경 월급날: "),
                Expanded(
                  child: TextField(
                    controller: teCnt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '월급일 입력',
                    ),
                  )
                )
              ],
            ),
            ElevatedButton(// 1~30 사이의 수, 없으면 insert 있으면 update <- 앱실행시 기본 설정으로 넣는방법
              onPressed: () { 
                updateSaleryDay(int.parse(teCnt.text));
                setState() {}
              },
              child: const Text("저장")
            )            
          ],
        )
      )
    );
  }
}