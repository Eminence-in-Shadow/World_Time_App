import 'package:flutter/material.dart';
import 'package:untitled4/services.dart';
class Choose_location extends StatefulWidget {
  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  List<WorldTime> locations=[
    WorldTime(location:'London',flag:'uk.png', url1: 'Europe/London'),
    WorldTime(location:'Seoul',flag:'south_korea.png', url1: 'Asia/Seoul'),
    WorldTime(location:'Athens ',flag:'greece.png', url1: 'Europe/Berlin'),
    WorldTime(location:'Cairo',flag:'egypt.png', url1: 'Africa/Cairo'),
    WorldTime(location:'Nairobi',flag:'kenya.png', url1: 'Africa/Nairobi'),
    WorldTime(location:'Jakarta',flag:'indonesia.png', url1: 'Asia/Jakarta'),
    WorldTime(location:'Chicago',flag:'usa.jpg', url1: 'America/Chicago'),
    WorldTime(location:'New_York',flag:'usa.jpg', url1: 'America/New_York'),
  ];
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime':instance.isdaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
          itemCount: locations.length,//tell how many items are there in the list
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  } ,
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('asset/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
