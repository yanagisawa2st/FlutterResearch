import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class SensorScreen extends StatefulWidget{
  const SensorScreen({Key?key}) : super(key:key);

  @override 
  _SensorScreen createState()=> _SensorScreen();
}

class _SensorScreen extends State<SensorScreen>{
  String _userAccelerometerValues = "";
  String _gyroscopeValues = "";
   
   //ライフサイクル画面を遷移する際、実行中の処理を破棄する。
   @override 
   void dispose(){
    super.dispose();
    
   }

  //ライフサイクル初期化時に走る処理
   @override
  void initState() {
    super.initState();
    //listenを使うことでデバイスを手で振ったときに加速度センサーの処理が走る
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        //取得したデータを_userAccelerometerValuesに代入しsetStateで表示
        setState(() {
          _userAccelerometerValues =
              "加速度センサー\n${event.x}\n${event.y}\n${event.z}";
              print(event.x);
              print(event.y);
              print(event.z);
              
        });
      },
        onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Sensor Not Found"),
                  content: Text(
                      "It seems that your device doesn't support Accelerometer Sensor"),
                );
              });
        },
        cancelOnError: true,
    );

    //listenを使うことでデバイスを手で振ったときにジャイロセンサーの処理が走る
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        //取得したデータを_gyroscopeValuesに代入しsetStateで表示
        setState(() {
          _gyroscopeValues = "ジャイロセンサー\n${event.x}\n${event.y}\n${event.z}";
        });
      },
       onError: (e) {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Sensor Not Found"),
                  content: Text(
                      "It seems that your device doesn't support Accelerometer Sensor"),
                );
              });
        },
        cancelOnError: true,
    );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed:(){}, icon: Icon(Icons.chevron_left)),
          title: Text("Sensor"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(_userAccelerometerValues,
                style: Theme.of(context).textTheme.headline6),
            Text(_gyroscopeValues,
                style: Theme.of(context).textTheme.headline6),
          ],
        ));
  }

 
}