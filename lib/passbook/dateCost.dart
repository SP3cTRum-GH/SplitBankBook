import 'package:flutter/material.dart';
import 'package:split_bankbook/db/database.dart';

class DateCost extends StatefulWidget {
  final Stream<List<LivingData>> data;
  const DateCost({super.key,required this.data});
 
  @override
  State<DateCost> createState() => _DateState();
}

class _DateState extends State<DateCost>{
  List<LivingData>livingViewData = [];
  @override
  Widget build(BuildContext context) {
     return StreamBuilder(
              stream: widget.data, 
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
                  livingViewData = snapshot.data!;
                   return ListView.builder(
                      padding: const EdgeInsets.all(3),
                      itemCount: livingViewData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10), 
                            child: Row(
                              children: [
                                Expanded(
                                  child:Text(livingViewData[index].name, 
                                    style: const TextStyle(fontSize: 21)
                                  )
                                ),
                                Expanded(
                                  child:Text(livingViewData[index].money.toString(), 
                                    style: const TextStyle(fontSize: 21)
                                  )
                                )
                              ],
                            )
                          ),
                        );
                      }
                    );
                }
              }
            );
  }
  
}