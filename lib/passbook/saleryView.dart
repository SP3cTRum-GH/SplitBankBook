import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/setting/setSaleryDay.dart';
import 'package:split_bankbook/setting/setSaleryMoney.dart';

class SaleryView extends StatefulWidget{
  const SaleryView({super.key});
  
   @override
  State<SaleryView> createState() => _SaleryViewState();
}

class _SaleryViewState extends State<SaleryView>{
  Mydatabase db = Mydatabase.instance;
  List<TotalData> totalData = [];
  Stream<List<TotalData>> selectTotal(){
    return db.totalRepo.readAll();
  }
  
  Future<List<SaleryData>> selectSalery() async {
    final res = await db.saleryRepo.readauto();
    return res;
  }
  
  Future update(int type, BigInt money){
    return db.totalRepo.updateMoney(type, money);
  }

  Future sendingNestEgg(BigInt money){
    return db.nestEggRepo.insertMoney(0, 3, money);
  }

  TextEditingController addMoney = TextEditingController();
  TextEditingController sendNestEgg = TextEditingController();
  TextEditingController sendLiving = TextEditingController();
  BigInt autoMoney = BigInt.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("월급통장"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst); 
          },
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder(
            stream: selectTotal(), 
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              } 
              else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } 
              else if (!snapshot.hasData) {
                return Text('No data');
              } 
              else {
                totalData = snapshot.data!;
                return Card(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child:Text("현재금액: ${totalData[0].money} ", style: TextStyle(fontSize: 21))
                  ),
                );
              }
            }
          ),
          Card(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Padding( // steam형 future형으로 바꿀것
                        padding: const EdgeInsets.only(left: 10), 
                        child: TextButton(
                          child: const Text("자동이체통장 이체"),
                          onPressed: () async {
                            List<SaleryData> autoData = await selectSalery();
                            autoMoney = autoData[0].salery;

                            print(autoMoney);
                            update(0, totalData[0].money - autoMoney);
                            update(1, totalData[1].money + autoMoney);
                          },
                        )
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10), 
                        child:Row(
                          children: [
                            Expanded(
                              child:TextField(
                                controller: sendLiving,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '이체금액 입력',
                                ),
                              )
                            ),
                            TextButton(
                              child: const Text("생활비통장 이체"),
                              onPressed: () {
                                update(0, totalData[0].money-BigInt.parse(sendLiving.text));
                                update(2, totalData[2].money+BigInt.parse(sendLiving.text));
                              },
                            )
                          ],
                        )
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10), 
                        child: Row(
                          children: [
                            Expanded(
                              child:TextField(
                                controller: sendNestEgg,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '이체금액 입력',
                                ),
                              )
                            ),
                            TextButton(
                              child: const Text("비상금통장 이체"),
                              onPressed: () {
                                update(0, totalData[0].money-BigInt.parse(sendNestEgg.text));
                                update(3, totalData[3].money+BigInt.parse(sendNestEgg.text));
                                sendingNestEgg(BigInt.parse(sendNestEgg.text));
                              },  
                            )
                          ],
                        )
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
                                update(0,totalData[0].money+BigInt.parse(addMoney.text));
                              },  
                            )
                          ]
                        ),
                      )
                    )
                  ]
                ),
              )
            ),
          Card(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SetSaleryDay()));
                  },
                  child: Text("월급날 설정")
                  )
                ),
                Expanded(
                  child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SetSaleryMoney()));
                  },
                  child: Text("월급액수 설정")
                ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}