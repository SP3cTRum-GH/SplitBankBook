import 'package:flutter/material.dart';

class FixedView extends StatefulWidget{
  const FixedView({super.key});
  
   @override
  State<FixedView> createState() => _FixedViewState();
}

class _FixedViewState extends State<FixedView>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Text("fixed")
    );
  }
}