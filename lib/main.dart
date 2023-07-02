import 'package:flutter/material.dart';
import 'package:untitled4/choose_location.dart';
import 'package:untitled4/home.dart';
import 'package:untitled4/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Choose_location(),
      },
    ));
