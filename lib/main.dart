import 'package:flutter/material.dart';
import 'bmi.dart';
import 'bmi_result.dart';
import 'about.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home:  InputBMI(),
      routes: <String, WidgetBuilder>{
        '/bmi' : (BuildContext context) => new InputBMI(),
        '/about' : (BuildContext context) => new MyProfil(),

      },
    ));