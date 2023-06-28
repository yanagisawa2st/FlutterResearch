import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QrScreen extends StatefulWidget{
  QrScreen({Key?key}) : super(key:key);

  @override 
  _QrScreen createState()=> _QrScreen();
}

class _QrScreen extends State<QrScreen>{
   /**
    qr_code_scannerというパッケージを使用して、
    QRコードの処理を実装する。
    １，85行目の引数のkeyに入れるためのGlobalKeyを初期化
    2,QRコードをキャプチャするための変数を25行目のQRViewControllerで宣言
    3,キャプチャしたデータをバーコードとして変数に入れるresultを宣言
    */
  GlobalKey gkey = GlobalKey();
  QRViewController?controller;
  Barcode? result;

  @override 
  Widget build(BuildContext context){

       //setQR関数内で表示されたリンクをタップしたときの処理を実行
       setQR(Barcode? result)async{
          print("test");
          print(result);
          //Uri.parseで取得したＱＲコードのデータをＵｒｉ型に変化させる
          var uri = Uri.parse(result!.code.toString());
          print(uri);

          //41行目でスナックバーを表示させる
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
            
              content: Container(
                height: 40,
               
                child:TextButton(
              onPressed:(){
                print("you tap link!!");

                //指定したURLのページに画面遷移
                launchUrl(uri);
              }, child: Text(uri.toString(),style: TextStyle(color:Colors.blue,decoration: TextDecoration.underline),textAlign: TextAlign.center,)),),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: 600),
              )
          );
     
        }

    void scanHandler(QRViewController controller){
        this.controller = controller;
        
       ///QRコードをキャプチャする処理
       ///キャプチャしたデータはeventという変数になる
        controller.scannedDataStream.listen((event){
           //継承したStateFulWidgetのsetState関数により、更新したデータを画面に反映させる
           setState((){
             //eventのデータをバーコード型としてresult変数に入れる
             result = event;

         
           var data = result;
            setQR(data);
           });
        });


    }
    return Scaffold(
        body:Center(
          child:Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
       

              SizedBox(height: 100,),
             
              Container(
                width: 400,
                height: 400,
                ///カメラが起動してQRコードの画面が表示される。
                ///引数にglobalKeyとQRコードを操作するための関数名を設定する。
                child:QRView(key: gkey, onQRViewCreated: scanHandler)
              ),
              SizedBox(height: 15,),
             

             
              
            ],
          )
        )
    );
  }
}