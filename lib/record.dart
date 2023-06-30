import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class RecordScreen extends StatefulWidget{
  RecordScreen({Key?key}) : super(key:key);

  @override 
  _RecordScreen createState()=> _RecordScreen();
}

class _RecordScreen extends State<RecordScreen>{
  var lastWords = "";
  var lastError = "";
  var lastStatus = "";

  ///SpeechToTextを使い、話した言葉を聞き取り、文字に変換
  ///SpeechToTextというパッケージを使うため、初期化させる。

  stt.SpeechToText speach = stt.SpeechToText();

  var text = "録音した文字の表示";
  @override 

  Widget build(BuildContext context){

    void resultListener(SpeechRecognitionResult result){
      //StatefulWidgetのsetState関数で更新した値を画面に反映させる。
      setState((){
        text = result.recognizedWords;
      });
    }

    void errorListener(SpeechRecognitionError error){
      //録音に失敗した際にsetStateで画面にエラー内容を反映
      setState(() {
        lastError = '${error.errorMsg} - ${error.permanent}';
      });
    }

    void StatusListener(String status){
      //最後の言葉を聞き取り録音
      setState(() {
        lastStatus = status;
      });
    }

    Future<void>SpeechOut()async{
      //初期化処理
      bool available = await speach.initialize(onError: errorListener,onStatus: StatusListener);

      if(available){
        //話している言葉を聞き取る
        speach.listen(onResult: resultListener);
      }else{
        print("The user has denied the use of speech regognition");
      }
    }
    //録音を停止する関数
    Future<void>StopSpeech()async{
      speach.stop();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.chevron_left)),
        title:Text("Record"),
        centerTitle: true,
      ),
      body:Center(
      child: Column(
        children: [
        SizedBox(height: 100,),
        Text("Voice Recoder",style:TextStyle(color:Colors.purple,fontSize: 25)),
        SizedBox(height: 15,),
        Image.network("https://thumbs.dreamstime.com/b/play-podcast-logo-icon-design-can-be-used-as-complement-to-127257792.jpg",width:200),
        SizedBox(height: 10,),
        Text(text),
        SizedBox(height: 100,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "start",
            onPressed:(){
          //スピーチの開始
          SpeechOut();
        },child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.play_arrow),
          Text("Start")
        ]),backgroundColor: Colors.purpleAccent,),
        SizedBox(width: 15,),
         FloatingActionButton(
            heroTag: "stop",
            onPressed:(){
          //スピーチの停止
          StopSpeech();
        },child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.play_arrow),
          Text("Stop",style: TextStyle(color:Colors.white),)
        ]),backgroundColor: Colors.grey,),
        ],),

        SizedBox(height: 10,),
        Text("ステータス:" + lastStatus)
      ]
      ),)
    );
  }
}