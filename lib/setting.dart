import 'package:flutter/material.dart';
import 'package:split_bankbook/setting/setLivingMoney.dart';
import 'package:split_bankbook/setting/setSaleryDay.dart';
import 'package:split_bankbook/setting/setSaleryMoney.dart';

class SettingView extends StatefulWidget{
  const SettingView({super.key});
  
   @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title:TextButton(
                child: const Text("월급날 설정"),
                onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  SetSaleryDay()));
                },
              )
            ),
            ListTile(
              title: TextButton(
                child: const Text("월급액수설정"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  SetSaleryMoney()));
                },
              )
            ),
            ListTile(
              title: TextButton(
                child: const Text("목표 생활비 설정"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SetLivingMoney()));
                },
              )
            )
          ],
        )
      )
    );
  }
}