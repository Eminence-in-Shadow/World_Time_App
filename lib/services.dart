import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  late String location;//location time for UI
  late String time;//the time in that location
  late String flag;//url to an asset flag icon
  late String url1;//location url for api endpoint
  late bool isdaytime;//true or false if daytime or not
  WorldTime({required this.location,required this.flag,required this.url1});
  Future<void> getTime() async {
    try{
      //make request
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$url1');//
      Response response = await get(url);
      Map data=jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime= data['datetime'];
      String offset= data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);
      //create a datetime object
      DateTime now = DateTime.parse(datetime);
      now=now.add(Duration(hours:int.parse(offset) ));
      print(now);
      //Set the time property
      isdaytime= now.hour>6 && now.hour<20  ? true : false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error: $e');
      time='could not get the time data';
    }


  }
}
