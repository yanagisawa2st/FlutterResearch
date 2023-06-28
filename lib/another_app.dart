import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class AnotherApp extends StatefulWidget{
  AnotherApp({Key?key}) : super(key:key);

  @override 
  _AnotherApp createState()=> _AnotherApp();
}

class _AnotherApp extends State<AnotherApp>{

  String? encodeQueryParameters(Map<String,String> params){
    return params.entries.map((MapEntry<String,String>e)=>'${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  //タップすると他のアプリに画面遷移させるためにurl_launcherというパッケージを使用する
  Future<void>_launcher(Uri uri)async{
     try{
         //存在するURLかif文でチェックする
        if(await canLaunchUrl(uri)){
          //指定したURLに飛ぶ
          await launchUrl(uri);
        }else{
          throw 'Could not launch $uri';
        }
     }catch(err){
        print(err);
     }
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.chevron_left)),
        title: Text("Another App"),
        centerTitle: true,
      ),
      body:Center(
        child:Column(
          children: [
          SizedBox(height: 150,),
          Text("Chooose App ",style:TextStyle(fontWeight: FontWeight.w400)),
          SizedBox(height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap:(){

                   //タップするとG-mailに飛ぶ処理
                   Uri uri = Uri(
                    //schemeでG-mailに設定
                    scheme: 'mailto',
                    //メールのパスを設定
                    path:"yanagisawa@2st.co.jp",
                    query:encodeQueryParameters(<String,String>{
                      'subject':'Testing mail launch',
                      'body' : 'this is testing email'
                    })
                   );
                   _launcher(uri);
                },
                child:Column(children: [
                Image.network("https://play-lh.googleusercontent.com/KSuaRLiI_FlDP8cM4MzJ23ml3og5Hxb9AapaGTMZ2GgR103mvJ3AAnoOFz1yheeQBBI",width:100,height:80),
                SizedBox(height: 10,),
                Text("Gmail")
              ],),),
              
              InkWell(
                onTap:(){
                  //タップすると電話のアプリに飛ぶ
                  Uri uri = Uri(
                    //shemeでtelを指定
                    scheme:'tel',

                    //デフォルトで電話番号を指定
                    path:'+8109012887568',
                    query:encodeQueryParameters(<String,String>{
                      'body':Uri.encodeComponent('test')
                    })
                  );
                  _launcher(uri);
                },
                child:Column(children: [
                Image.network("https://upload.wikimedia.org/wikipedia/commons/7/7e/Phone_iOS.png",width:100,height:80),
                SizedBox(height: 10,),
                Text("tel")
              ],),),
          ],),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
               InkWell(
                //タップするとSMSメールに飛ぶ
                onTap:(){
                    Uri uri = Uri(
                    //shemeでsmsを指定
                    scheme:"sms",
                    //smsで紐づく電話番号を指定
                    path:"+8109012887568",
                    query:encodeQueryParameters(<String,String>{
                      'body':Uri.encodeComponent('Test'),
                    })
                  );
                  _launcher(uri);
                },
                child:Column(children: [
                Image.network("https://help.apple.com/assets/63CF0773EF8ABA61CC409172/63CF077AEF8ABA61CC40917A/ja_JP/e4dbb8e240d50cf30bab73b272a3760b.png",width:100,height:80),
                SizedBox(height: 10,),
                Text("mail")
              ],),),
              InkWell(
                //タップするとYouTubeのページに飛ぶ
                onTap:()async{
                  //urlを指定
                  final uri = "https://www.youtube.com/";
                  //文字列をUri型に変換
                  final url_parse = Uri.parse(uri);
                  try{
                    //Webに存在するＵＲＬか条件分岐
                    if(await canLaunchUrl(url_parse)){
                      //指定のＵＲＬのサイトに飛ぶ
                       launchUrl(url_parse);
                    }else{
                      final Error error = ArgumentError('Error launching $uri');
                      throw error;
                    };
                  }catch(err){
                      print(err);
                  }
                },
                child:Column(children: [
                Image.network("https://www.youtube.com/img/desktop/yt_1200.png",width:100,height:80),
                SizedBox(height: 10,),
                Text("YouTube")
              ],),),
             
            ],
          ),
           SizedBox(height: 5,),
           FloatingActionButton(onPressed:()async{
                await LaunchApp.openApp(
                   androidPackageName: 'com.google.android.apps.googleassistant',
                );
              },child:Icon(Icons.g_mobiledata))
        ],)
      )
    );
  }
}

