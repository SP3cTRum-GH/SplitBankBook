import 'package:flutter/material.dart';

class ShoppingCost extends StatefulWidget {
  const ShoppingCost({super.key});
 
  @override
  State<ShoppingCost> createState() => _DateState();
}

class _DateState extends State<ShoppingCost>{
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