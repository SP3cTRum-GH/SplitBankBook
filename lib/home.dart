import 'package:flutter/material.dart';
import 'package:split_bankbook/banksplit/banksplitStepView.dart';
import 'package:split_bankbook/db/database.dart';
import 'package:split_bankbook/passbook/automaticView.dart';
import 'package:split_bankbook/passbook/livingView.dart';
import 'package:split_bankbook/passbook/nestEggView.dart';
import 'package:split_bankbook/passbook/saleryView.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});
  
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView>{
  Mydatabase db = Mydatabase.instance;
  
  List<TotalData> totalData = [];
  Stream<List<TotalData>> selectTotal(){
    return db.totalRepo.readAll();
  }
  
  Future<List<SaleryData>> selectSalery(int index) async {
    final res = await db.saleryRepo.readsettingValue(index);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    const List<String>passbook = ["월급통장","자동이체통장","생활비통장","비상금통장"];
    List<TotalData> totalData = [];
    List<SaleryData> settingData = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("통장분할 도우미"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child:Card(
              child: StreamBuilder(
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
                    return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(passbook[0], textAlign: TextAlign.center,),
                                Text("₩${totalData[0].money}", textAlign: TextAlign.center,),
                              ],
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SaleryView())),
                          )
                        ),
                       Expanded(
                          child: TextButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(passbook[1], textAlign: TextAlign.center,),
                                Text("₩${totalData[1].money}", textAlign: TextAlign.center,),
                              ],
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AutomaticView())),
                          )
                        ),
                        Expanded(
                          child: TextButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(passbook[2], textAlign: TextAlign.center,),
                                Text("₩${totalData[2].money}", textAlign: TextAlign.center,),
                              ],
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LivingView())),
                          )
                        ),
                        Expanded(
                          child: TextButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(passbook[3], textAlign: TextAlign.center,),
                                Text("₩${totalData[3].money}", textAlign: TextAlign.center,),
                              ],
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NestEggView())),
                          )
                        ),
                      ],
                    )
                    );
                    // return ListView.builder(
                    //   itemCount: 4,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Container(
                    //       margin: EdgeInsets.fromLTRB(0,20,0,20),
                    //       //minVerticalPadding: 20,
                    //       child: Expanded(
                    //         child: ElevatedButton(
                    //           onPressed: () { 
                    //             switch(index){
                    //               case 0:
                    //                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SaleryView()));
                    //                 break;
                    //               case 1:
                    //                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AutomaticView()));
                    //                  break;
                    //               case 2:
                    //                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LivingView()));
                    //                  break;
                    //               default:
                    //                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NestEggView()));
                    //             }
                    //           },
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(passbook[index]),
                    //               Text("₩${totalData[index].money}")
                    //             ],
                    //           )
                    //         ),
                    //       ),
                    //     );
                    //   }
                    // );
                  }
                }
              ),
            )
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Card(
              child: TextButton(
                onPressed: () async {
                  List<SaleryData> autoData = await selectSalery(2);
                  List<SaleryData> LivingData = await selectSalery(3);
                  settingData.add(autoData[0]);
                  settingData.add(LivingData[0]);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BanksplitStepView(data: totalData, settingData: settingData)));
                }, 
                child: const Text("통장분할 시작")
              )
            )
            
          )
        ],
      )
    );
  }
}