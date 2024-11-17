import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/passbook/dateCost.dart';
import 'package:split_bankbook/passbook/livingCost.dart';
import 'package:split_bankbook/passbook/shoppingCost.dart';

class LivingView extends StatefulWidget{
  const LivingView({super.key});
  
  @override
  State<LivingView> createState() => _LivingViewState();
}

const List<String> list = <String>['데이트비용', '생활비용', '쇼핑비용'];
class _LivingViewState extends State<LivingView>{
  Mydatabase db = Mydatabase.instance;
  List<TotalData> totalData = [];
  Stream<List<TotalData>> selectTotal(){
    return db.totalRepo.readAll();
  }
  Stream<List<LivingData>> selectLiving(int idx){
    return db.livingRepo.read(idx);
  }
  Future insertLiving(int type, String name, BigInt money){
    return db.livingRepo.insertMoney(type,name,money);
  }
  Future update(BigInt money){
    return db.totalRepo.updateMoney(2, money);
  }


  String dropdownValue = list.first;
  void addDialog() {
    TextEditingController name = TextEditingController();
    TextEditingController money = TextEditingController();

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
                new Text("사용목록 추가"),
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
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '항목이름 입력',
                      ),
                    ),
                    TextField(
                      controller: money,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '금액 입력',
                      ),
                    ),
                    Text('타입선택'),
                    StatefulBuilder(//위젯안에 State scope를 가지고 있게 해주는 builder
                      builder: (context, setS) {
                        return DropdownButton<String>(
                          value: dropdownValue,
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value){
                            setS(() {
                              dropdownValue = value!;
                            });
                          }
                        );
                      }
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("저장"),
                onPressed: () {
                  //db저장
                  insertLiving(list.indexOf(dropdownValue), name.text, BigInt.parse(money.text));
                  update(totalData[2].money-BigInt.parse(money.text));
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
        title: const Text("생활비통장"),
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
                    child:Text("현재금액: ${totalData[2].money} ", style: TextStyle(fontSize: 21))
                  ),
                );
              }
            }
          ),
          Expanded(
            child: DefaultTabController(
              length: 3, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TabBar(
                    tabs: [
                      Tab(
                        text:"데이트비용"
                      ),
                      Tab(text: "생활비용"
                      ),
                      Tab(
                        text: "쇼핑비용"
                      )
                    ],
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        DateCost(data: selectLiving(0)),
                        DateCost(data: selectLiving(1)),
                        DateCost(data: selectLiving(2))
                      ]
                    )
                  ),
                  ElevatedButton(
                    onPressed: (){
                      addDialog();
                    }, 
                    child: Text("사용내역 추가")
                  )
                ],
              )
            )
          )
        ]
      )
    );
  }
}

