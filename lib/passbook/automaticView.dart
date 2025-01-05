import 'package:flutter/material.dart';
import 'package:multi_stream_builder/multi_stream_builder.dart';
import 'package:split_bankbook/db/database.dart';
//TODO 삭제기능 구현 
class AutomaticView extends StatefulWidget{
  const AutomaticView({super.key});
  
   @override
  State<AutomaticView> createState() => _AutomaticViewState();
}

class _AutomaticViewState extends State<AutomaticView>{
   Mydatabase db = Mydatabase.instance;

  Stream<List<AutomaticData>> selectAuto(){
    return db.automaticRepo.readAll();
  }

  Future insertauto(BigInt money, String name, int day){
    return db.automaticRepo.insertMoney(money, name, day);
  }

  Stream<List<TotalData>> selectTotal(){
    return db.totalRepo.readIndex([1]);
  }

  Future updateSaleryDay(int saleryDay){
    return db.saleryRepo.updateSaleryDay(2, saleryDay);
  }

  Future updateSalery(BigInt money){
    return db.saleryRepo.updateSaleryMoney(2, money);
  }

  void addDialog() {
    TextEditingController autoname = TextEditingController();
    TextEditingController automoney = TextEditingController();
    TextEditingController day = TextEditingController();
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("이체목록 추가"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    TextField(
                      controller: autoname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '자동이체항목이름 입력',
                      ),
                    ),
                    TextField(
                      controller: automoney,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '자동이체금액 입력',
                      ),
                    ),
                    TextField(
                      controller: day,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '이체일 입력',
                      ),
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("저장"),
                onPressed: () {
                  insertauto(BigInt.parse(automoney.text), autoname.text, int.parse(day.text));
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("자동이체통장"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MultiStreamBuilder(
              streams: [selectAuto(), selectTotal()],
              builder: (context, snapshot){
                // if(snapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                // else if(snapshot.hasError) {
                //   return Expanded(child: Container());
                // }
                if (true) {
                  final autolist = snapshot[0] ?? [];
                  final l2 = snapshot[1] ?? [];
                  BigInt autoMoney = BigInt.zero;
                  for(int i=0; i<autolist.length; i++){
                    autoMoney += autolist[i].money;
                  }
                  updateSalery(autoMoney);
                  return Expanded(
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(width: double.infinity, child: Text("현재금액: ${l2[0].money}", style: TextStyle(fontSize: 21))),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("자동이체 금액: ${autoMoney}", style: TextStyle(fontSize: 18))
                                ],
                              )
                            ],
                          )
                        ),
                        Expanded(
                          child: Card(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(3),
                              itemCount: autolist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child:Text(autolist[index].name)
                                      ),
                                      Expanded(
                                        child:Text("${autolist[index].money}")
                                      )
                                    ],
                                  )
                                );
                              }
                            )
                          )
                        ),
                      ],
                    )
                  );
                }
              }
            ),
            // Card(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(left: 15),
            //         child: Container(width: double.infinity, child: const Text("현재금액: ", style: TextStyle(fontSize: 21))),
            //       ),

            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text("자동이체 금액: ${autoMoney}", style: TextStyle(fontSize: 18)),
            //           Text("이체일:", style: TextStyle(fontSize: 18))
            //         ],
            //       )
            //     ],
            //   )
            // ),
          
            // Expanded(
            //   child: Card(
            //     child: StreamBuilder(
            //       stream: selectAuto(), 
            //       builder: (context, snapshot){
            //         if(snapshot.connectionState == ConnectionState.waiting) {
            //           return const Center(child: CircularProgressIndicator());
            //         }
            //         else if(snapshot.hasError) {
            //           return Expanded(child: Container());
            //         }
            //         else{
            //           final autolist = snapshot.data ?? [];
            //           autoMoney = BigInt.zero;
            //           return Expanded(
            //             child: ListView.builder(
            //               scrollDirection: Axis.vertical,
            //               padding: const EdgeInsets.all(3),
            //               itemCount: autolist.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 autoMoney += autolist[index].money;
                            
            //                 return Expanded(
            //                   child: Row(
            //                     children: [
            //                       Text(autolist[index].name),
            //                       Text("${autolist[index].money}")
            //                     ],
            //                   )
            //                 );
            //               }
            //             )
            //           );
            //         }
            //       }
            //     ),
            //   ),//db에서 자동이체 목록 불러오기
            // ),

            ElevatedButton(
              child: Text("이체목록 추가"),
              onPressed: () {
                addDialog();
              },
            )
          ]
        )
      )
    );
  }
}