import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/setting/setSaleryDay.dart';
import 'package:split_bankbook/setting/setSaleryMoney.dart';
//todo: stepview로 통장분할 도우미 구현
class SaleryView extends StatefulWidget{
  const SaleryView({super.key});
  
   @override
  State<SaleryView> createState() => _SaleryViewState();
}

class _SaleryViewState extends State<SaleryView>{
  Mydatabase db = Mydatabase.instance;
  List<TotalData> totalData = [];
  DateTime now = DateTime.now();
  int nextSaleryDay = 0;
  Stream<List<TotalData>> selectTotal(){
    return db.totalRepo.readAll();
  }
  
  Future<List<SaleryData>> selectSalery() async {
    final res = await db.saleryRepo.readsettingValue(1);
    return res;
  }


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
          FutureBuilder(
            future: selectSalery(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) { // snapshot이 _getData()에서 받아올 값을 저장한다. 여기에 null이 아니라 값이 있다면,
                final data = snapshot.data; // 해당 data를 가져온다. 여기서는 _getData()에서 반환하는 String값이 된다
                DateTime next = DateTime(now.year,now.month,data![0].saleryDay);
                if(now.isBefore(next)) {
                  nextSaleryDay = next.difference(now).inDays;
                } else {
                  final b2 = DateTime(now.year, now.month + 1, data![0].saleryDay);
                  nextSaleryDay = b2.difference(now).inDays;
                }
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("월급날: ${data![0].saleryDay}"),
                      ),
                      ListTile(
                        title: Text("월급 금액: ₩${data![0].salery}")
                      ),
                      ListTile(
                        title: Text("월급날까지 남은 일수: D-$nextSaleryDay")
                      )
                    ]
                  ),
                );
              } else {
                return Text("Loading.."); // 아직 snapshot에 데이터가 없기 때문에 로딩중으로 표시한다.
              }
            }
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