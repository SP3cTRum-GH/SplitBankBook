import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
//todo: 지출시 금액 감소 설정
class NestEggView extends StatefulWidget{
  const NestEggView({super.key});
  
   @override
  State<NestEggView> createState() => _NestEggViewState();
}

class _NestEggViewState extends State<NestEggView>{
  Mydatabase db = Mydatabase.instance;
  List<TotalData> totalData = [];
  Stream<List<TotalData>> selectTotal(){
    return db.totalRepo.readIndex([3,2]);
  }
  Stream<List<NestEggData>> selectNestEgg(){
    return db.nestEggRepo.readAll();
  }
  Future update(int type, BigInt money){
    return db.totalRepo.updateMoney(type, money);
  }
  Future sendingLiving(BigInt money){
    return db.nestEggRepo.insertMoney(3, 2, money);
  }

TextEditingController sendLiving = TextEditingController();
   @override
  Widget build(BuildContext context) {
    const List<String>passbook = ["월급통장","자동이체통장","생활비통장","비상금통장"];
    return Scaffold(
       appBar: AppBar(
        title: const Text("비상금통장"),
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
                    child:Text("현재금액: ${totalData[1].money} ", style: TextStyle(fontSize: 21))
                  ),
                );
              }
            }
          ),
          
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Expanded(
              child: Card(//db에서 최근기록 불러올 부분
                child: StreamBuilder(
                  stream: selectNestEgg(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    else if (snapshot.hasError){
                      return Text('Error: ${snapshot.error}');
                    }
                    else {
                      List<NestEggData>log = snapshot.data!;
                      if(log.isEmpty){
                        return Container(width: double.infinity, height: double.infinity,);
                      }
                      else{
                        int size = log.length;
                        if(size>10){
                          size = 10; //10개 이상일시 10개만 표시
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.all(3),
                          itemCount: size,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 10), 
                                child: Row(
                                  children: [
                                    Expanded(
                                      child:Text(passbook[log[size-1-index].from].toString(), 
                                        style: const TextStyle(fontSize: 21)
                                      )
                                    ),
                                    Expanded(
                                      child:Text(passbook[log[size-1-index].to].toString(), 
                                        style: const TextStyle(fontSize: 21)
                                      )
                                    ),
                                    Expanded(
                                      child:Text(log[size-1-index].money.toString(), 
                                        style: const TextStyle(fontSize: 21)
                                      )
                                    ),
                                  ],
                                )
                              ),
                            );
                          }
                        );
                      }
                    }
                  }
                )
              )
            )
          ),
          ElevatedButton(
            onPressed: () { 
            },
            child: Row(
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
                  child: const Text("원 생활비통장 이체"),
                  onPressed: () {
                    update(3, totalData[1].money-BigInt.parse(sendLiving.text));
                    update(2, totalData[0].money+BigInt.parse(sendLiving.text));
                    sendingLiving(BigInt.parse(sendLiving.text));
                  },
                )
              ],
            )
          ),
        ]
      )
    );
  }
}