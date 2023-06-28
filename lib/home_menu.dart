import 'package:flutter/material.dart';
import 'gps.dart';
import 'sensor.dart';
import 'camera1.dart';
import 'another_app.dart';
import 'speech.dart';
import 'record.dart';
import 'qr_prepare.dart';
import 'credi_card.dart';
import 'users.dart';

class HomeMenu extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
          centerTitle: true,
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Home",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          ],)
        ),

        //ドロワーを使い、タップして複数のページに画面遷移できるようにする
        drawer: Drawer(
          child:Opacity(
            opacity: 0.8,
            child:Container(
            color: Colors.grey,
            child:ListView(
            padding:EdgeInsets.zero,
            children:[
              
              SizedBox(height: 100,),
                //ListTileにGPSのページのタイトルを記載。
                ListTile(
                  leading: Icon(Icons.gps_fixed,size: 30,),
                  title: Text("GPS",style: TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20),),

                  //タップするとＧＰＳのページに飛ぶ
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>GpsClass()));
                  },
                ),

                //ListTileにセンサーのページのタイトルを記載。
                ListTile(
                  leading:Icon(Icons.wifi),
                  title: Text("Sensors",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),

                  //タップするとセンサーのページに飛ぶ
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SensorScreen()));
                  }
                ),

                //ListTitleにImage Pickerのページのタイトルを記載
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Image Picker",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),

                  //タップするとCameraのページに飛ぶ
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Camera1()));
                  },
                ),

                //ListTitleにSNS(他のアプリと連携する)ページのタイトルを記載
                ListTile(
                  leading: Icon(Icons.android),
                  title:Text("SNS",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),

                  //タップすると(他のアプリと連携する)ページに飛ぶ
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>AnotherApp()));

                  }
                ),

                //ListTileに音声読み上げのページのタイトルを記載
                ListTile(
                  leading:Icon(Icons.speaker),
                  title: Text("Speech",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),

                  //タップすると音声読み上げのページに飛ぶ
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>SpeechScreen()));
                  }
                ),

                //ListTileに録音のページのタイトルを記載
                ListTile(
                  leading:Icon(Icons.record_voice_over_sharp),
                  title:Text("Record",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),

                  //タップすると録音のページに飛ぶ
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>RecordScreen()));
                  }
                ),

                //ListTileにQRコードのページを記載
                ListTile(
                  leading:Icon(Icons.qr_code_2),
                  title:Text("Scan QR",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),

                  //タップするとQRページに飛ぶ
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>QrPrepare()));
                  }
                ),

                /**個人情報が必要なパッケージな為、実装は何もしていない */
                ListTile(
                  leading:Icon(Icons.payment),
                  title:Text("Card",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize: 20)),
                  onTap:(){
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Card()));
                  }
                ),

                //ListTileにFirebaseのデータが表示されるページを記載
                ListTile(
                  leading: Icon(Icons.person),
                  title:Text("Users",style: TextStyle(color:Colors.purple,fontWeight: FontWeight.bold,fontSize:20),),
                  onTap:(){

                    //タップするとFirebaseのページに飛ぶ
                    Navigator.push(context,MaterialPageRoute(builder:(context)=> UserScreen()));
                  }
                ),
            ]
          )
          )
          )
        ),
      );
  }
}