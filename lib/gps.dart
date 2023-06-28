import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GpsClass extends StatefulWidget{
 const GpsClass({Key?key}) : super(key:key);

  @override 
  _GpsClass createState() => _GpsClass();
}

class _GpsClass extends State<GpsClass>{


  //現在地のデータを代入する変数
  String location = "No Location";

  //緯度のデータを代入する変数
  String latitude = "No Location";

  //経度のデータを代入する変数
  String lonitude = "No Location";

  @override 

  Future<void>getGps()async{

    //端末の位置情報を取得するための権限をチェックする初期化処理
    LocationPermission permission = await Geolocator.checkPermission();
    
    /**
     位置情報の取得の権限がない場合はif文以降の37行目の処理が
     走り、エラーとなる。
     */
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permission are denid');
      }
    }
    
       //GPSの処理を走らせるための初期化処理。インポートした２行目のgeolocatorを使用
       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
       
       /*
       43行目の変数positionを使い。現在地と現在地の緯度と経度を
       使う。
       継承したStatefulWidgetのsetStateを使い更新することで、51～53行目の処理内容を
　　　　画面に反映させる。
　　　　なお注意点としてこの処理をするために29～40行目の処理をしないと権限に関しての
　　　　エラーとなり、アプリに不具合が起こる。
       */
     setState(() {
       //locationに現在地のデータを代入
       location = position.toString();

       //緯度のデータを出力
       position.latitude.toString();

       //経度のデータを出力
       position.longitude.toString();
     });
    
  }

 

  Widget build(BuildContext context){

     Future<void>getMap()async{
    
    //端末の位置情報を取得するための権限をチェックする初期化処理
    LocationPermission permission = await Geolocator.checkPermission();

     /**
     位置情報の取得の権限がない場合はif文以降の37行目の処理が
     走り、エラーとなる。
     */

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        print('Location permission are denid');
      }
    }
      
       //GPSの処理を走らせるための初期化処理。インポートした２行目のgeolocatorを使用

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      /*
       43行目の変数positionを使い。現在地と現在地の緯度と経度を
       使う。
       継承したStatefulWidgetのsetStateを使い更新することで、51～53行目の処理内容を
　　　　画面に反映させる。
　　　　なお注意点としてこの処理をするために29～40行目の処理をしないと権限に関しての
　　　　エラーとなり、アプリに不具合が起こる。
       */


    //  setState(() async{


       //緯度のデータを出力
      latitude = position.latitude.toString();

       //経度のデータを出力
      lonitude = position.longitude.toString();
      
      //Googleマップのリンクに飛ぶようにlatitudeとlonitudeをセット
      final url = 'https://www.google.com/maps/search/?api=1&query=${latitude},${lonitude}';

      final uri = Uri.parse(url);

      /**
       119行目から123行目の実装にはurl_launcherというパッケージをインポートしなければならない。
       */

      //if文で実際に存在するURLかチェックする。
      if(await canLaunchUrl(uri)){

          //引数のURLのサイトに画面を遷移させる。
          //modeという引数はブラウザを立ち上げる際に必要
          launchUrl(uri,mode: LaunchMode.externalApplication);
      }
    //  });
     
    
  }
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left)),
        title: Text("Home"),
        centerTitle: true,
       ),
       body:Center(
        child:Column(children: [
          Text("Please displayed current location",style:TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 15,),
          Text(location),
          SizedBox(height: 150,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed:(){

            //ボタンをタップすると70行目から128行目までの処理が走る。
            getMap();
          }, child: Text("Show Map")),
          )
        ],)
       ),
    );
  }
}