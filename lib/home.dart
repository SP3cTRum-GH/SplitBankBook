import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  SaleryView()));
            },
            child: const Text("월급통장")
          ),
          ElevatedButton(
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AutomaticView()));
            },
            child: const Text("자동이체통장")
          ),
          ElevatedButton(
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LivingView()));
            },
            child: const Text("생활비통장")
          ),
          ElevatedButton(
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NestEggView()));
            },
            child: const Text("비상금통장")
          ),
        ]
      )
    );
  }
}