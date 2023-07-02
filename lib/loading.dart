import 'package:flutter/material.dart';
import 'package:untitled4/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' ;
 class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   void setupWorldTime() async{
     WorldTime instance=WorldTime(location:'Kolkata', flag: 'kolkata.png', url1: 'Asia/Kolkata');
     await instance.getTime();
     Navigator.pushReplacementNamed(context,'/home',arguments: {
       'location':instance.location,
       'flag':instance.flag,
       'time':instance.time,
       'isdaytime':instance.isdaytime,
     });
   }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
         color: Colors.white,
         size: 80.0,
       ),
      ),
    );
  }
}
