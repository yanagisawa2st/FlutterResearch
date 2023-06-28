import 'package:flutter/material.dart';
import 'qr_screen.dart';

class QrPrepare extends StatelessWidget{
  @override 

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left)),
        title: Text("QR_Code"),
        centerTitle: true,
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:(){
              print("test");
              //ボタンをするとQRコードの画面に遷移する
              Navigator.push(context,MaterialPageRoute(builder:(context)=>QrScreen()));
            }, child: Text("QRコード"))
        ],)
      ),
    );
  }
}