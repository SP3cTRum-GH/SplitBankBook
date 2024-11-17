import 'package:flutter/material.dart';

class LivingCost extends StatefulWidget {
  const LivingCost({super.key});
 
  @override
  State<LivingCost> createState() => _DateState();
}

class _DateState extends State<LivingCost>{
  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
          child: Card(
            child: ListTile(  //db에서 불러올부분
              title: Text("")
            )
          )
        ),    
      ]
    );
  }
  
}