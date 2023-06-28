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

   @override 
   void dispose(){
    super.dispose();
    
   }

   @override
  void initState() {
    super.initState();
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
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
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
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