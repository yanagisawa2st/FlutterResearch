import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera1 extends StatefulWidget{
  Camera1({Key?key}) : super(key:key);
  
  @override 
  _Camera1 createState()=> _Camera1();
}


class _Camera1 extends State<Camera1>{
  //XFile型で取得した画像を代入するための変数
  XFile? _image;

  //写真を取り込む機能の実装のために初期化。４行目でImage_Pickerというパッケージをインポートしカメラ機能実装させる。
  final imagePicker = ImagePicker();
  Future<void>getImageFromCamera()async{
    //引数のsourceで撮影用のカメラモードを選択
    final pickedFile = await imagePicker.pickImage(source:ImageSource.camera);

    setState((){
       /**
        if文で写真で取ったデータがNullじゃなければ
        _imageに代入する。
        */
       if(pickedFile != null){
        _image = XFile(pickedFile.path);
       }
    });
  }

  Future<void>getImageFromGarally()async{
    //引数のsourceでアルバムモードを指定
    final pickedFile = await imagePicker.pickImage(source:ImageSource.gallery);


    /**
     選択したアルバムがNullじゃなければ
     データを_imageに代入する。
     */
    setState((){
      if(pickedFile != null){
        _image = XFile(pickedFile.path);
      }
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.chevron_left)),
        title:Text("Camera"),
        centerTitle: true,
      ),
      body:Center(
          child: _image != null ? Image.file(File(_image!.path)) : Text("画像を選択してください",style:TextStyle(fontSize: 20)),
         ),

         floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///以下のようにFloatActionButtonを複数使用するにはheroTagで名前を識別する必要がある
            ///heroTagの名前は任意の物でOK
            ///75行目Camera
            ///79行目Garally
            FloatingActionButton(onPressed:(){
              //ボタンをタップすると14～33行目の処理が走る。
              getImageFromCamera();
              },child:Icon(Icons.camera_alt),heroTag: "Camera",),
           FloatingActionButton(onPressed:(){
            //ボタンをタップすると35～49行目の処理が走る。
            getImageFromGarally();
            },child:Icon(Icons.image),heroTag: "Garally",),

         ]),
    );
  }
}