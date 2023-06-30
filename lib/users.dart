import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserScreen extends StatefulWidget{
   UserScreen({Key?key}) : super(key:key);

   @override 
   _UserScreen createState()=> _UserScreen();
}

class _UserScreen extends State<UserScreen>{
  //firebaseのコレクションのnameフィールドから取り出した値を格納する変数
  List<String>name = <String>[];
  //firebaseのコレクションのageフィールドから取り出した値を格納する変数
  List<int>age = <int>[];
  //firebaseのコレクションのcountryフィールドから取り出した値を格納する変数
  List<String>country = <String>[];
  //firebaseのコレクションのpicsフィールドから取り出した値を格納する変数
  List<String>pics = <String>[];

  
  
   var test1;
 var test2;
 var test3;
 var test4;

 List<DocumentSnapshot>data = <DocumentSnapshot>[];

 


  @override 
  Widget build(BuildContext context){

   
    Map<String,dynamic>datas;

    
    void openArray()async{
       //firebase内で作成したusersコレクションを取得
       var docs = await FirebaseFirestore.instance.collection('users').get();
       print(docs);
      


    }

    
    
   
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.chevron_left)),
        title: Text("Firebase App"),
        centerTitle: true,
      ),
      body:Center(
        child:Column(children: [
          SizedBox(height: 25,),
          Text("Users",style:TextStyle(color:Colors.green,fontWeight: FontWeight.w500,fontSize: 25)),
          SizedBox(height: 15,),
          StreamBuilder(
            //streamのプロパティでFirebase内に記述したusersコレクションを指定
            stream:FirebaseFirestore.instance.collection('users').snapshots(),
            builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
             return      Expanded(
           child:GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.7
            ),
            itemCount:snapshot.data?.docs.length,
            itemBuilder:(BuildContext context,int index){
            
            
             
            
            return Card(
              shadowColor: Colors.grey,
              elevation:5,
              child:InkWell(
                
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /**
                   Image.networkを使用して画像を表示
                   引数内の[]でKeyを取得し、
                   １，index番号(82行目のitemBuilderの引数にあるindex番号)
                   2,データベースに記述したフィールド名(写真のURL)
                   →これらの情報を元に画像を表示させている
                   */
                  Image.network(snapshot.data?.docs[index]['imgs'] ?? "https://t4.ftcdn.net/jpg/00/82/02/77/360_F_82027785_Cl6iuS9TeMD1EUHgPh2ptUYidZpuhjkk.jpg",width: 400,height: 100),
                   
                 
                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                       /**
                   Textウィジェットを使用して名前と年齢を表示
                   引数内の[]でKeyを取得し、
                   １，index番号(77行目のitemBuilderの引数にあるindex番号)
                   2,データベースに記述したフィールド名(name,age)
                   →これらの情報を元にユーザーの個人情報を表示させている
                   */

                      children: [
                        Text("Name:",style:TextStyle(color:Colors.redAccent,fontWeight: FontWeight.bold)),
                        SizedBox(width: 5,),
                        Text(snapshot.data?.docs[index]['name'] ?? "null" +'(${snapshot.data?.docs[index]['age'].toString() ?? 0.toString()})',style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],),
                  ),
                   SizedBox(height: 5,),
                   Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(children: [
                           /**
                   Textウィジェットを使用して国名を表示
                   引数内の[]でKeyを取得し、
                   １，index番号(77行目のitemBuilderの引数にあるindex番号)
                   2,データベースに記述したフィールド名(country)
                   →これらの情報を元にユーザーの個人情報を表示させている
                   */
                        Text("Nation:",style:TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
                        Text(snapshot.data?.docs[index]['country'].toString() ?? "No Data",style:TextStyle(fontWeight: FontWeight.bold)),

                  ],),
                  ),
                 
                 
                
                ],
              ),
              ),
             );
            }
        ,)
         );
          })
        ],)
      ),
    );
  }
}