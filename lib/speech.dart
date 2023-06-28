import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

 class SpeechScreen extends StatefulWidget{
 const SpeechScreen({Key?key}) : super(key:key);

  @override 
  _SpeechScreen createState()=> _SpeechScreen();
}


class _SpeechScreen extends State<SpeechScreen>{
  ///flutter_ttsというパッケージを使用して、文字を読み上げる
  ///初期化させる
  FlutterTts tts = FlutterTts();

  //TextFieldに入力した文字を記憶させるためTextEditingControllerを初期化
  TextEditingController speechController = TextEditingController();

  @override 
  Widget build(BuildContext context){

    Future<void>speaker()async{

      //文字の言語を日本語化
      await tts.setLanguage("ja-JP");
      //喋る速さを設定
      await tts.setSpeechRate(1.0);
      //喋る音量の設定
      await tts.setVolume(1.0);
      //喋る抑揚を設定
      await tts.setPitch(1.0);

      //入力した文字を読み上げる
      await tts.speak(speechController.text);
    }

    Future<void>stoper()async{
      //読み上げるのを停止させる
      await tts.stop();
    }


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left)),
        title:Text("Speech"),
        centerTitle: true,
        ),
      body:Center(
        child:Column(children: [
           SizedBox(height:100),
           Text("読み上げるメッセージを入力してください",style:TextStyle(fontWeight: FontWeight.w500,color:Colors.green)),
           SizedBox(height: 15,),
           SizedBox(
            width: 300,
            child:  TextField(
            controller: speechController,
            decoration:InputDecoration(
              label:Text("テキストの入力",style: TextStyle(fontSize: 15),),
              
            ),
           ),
           ),
           SizedBox(height: 30,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed:(){
                //ボタンを押すと喋り始める
                speaker();
              },heroTag: "start",backgroundColor: Colors.green,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.play_arrow),
                Text("Start")
              ]),),
              SizedBox(width: 20,),
               FloatingActionButton(onPressed:(){
                //ボタンを押すと喋るの停止する
                stoper();
               },heroTag: "stop",backgroundColor: Colors.red,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                Icon(Icons.stop),
                Text("Stop")
              ]),),
           ],)
        ],)
      ),
    );
  }
}