import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    //set background
    String bgImage=data['isdaytime'] ? 'daytime.jpg': 'nighttime.jpg';
    Color bgColor=data['isdaytime'] ? Colors.blue: Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async{
                    dynamic result =await Navigator.pushNamed(context, '/location');
                    setState((){
                     data={
                       'time':result['time'],
                       'location':result['location'],
                       'isdaytime':result['isdaytime'],
                       'flag':result['flag']
                     };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.black,
                  ),
                  label: Text(
                      'Edit location',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                    data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
