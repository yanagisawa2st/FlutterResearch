import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget{
  CardScreen({Key?key}) : super(key:key);

  @override 
  _CardScreen createState()=> _CardScreen();
}

class _CardScreen extends State<CardScreen>{
  @override 

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Card"),
        centerTitle: true,
      ),
      body:Center(
        child:Text("Card")
      )
    );
  }
}