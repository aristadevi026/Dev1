import 'package:flutter/material.dart';
import 'dart:math';
import 'about.dart';


class BMIResult extends StatelessWidget {

  BMIResult({@required this.tinggi_badan, @required this.berat_badan, @required this.nama, @required this.thn_lahir, @required this.jk});
  final int tinggi_badan;
  final int berat_badan;
  final String nama;
  final int thn_lahir;
  final String jk;


  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan/pow(tinggi_badan/100,2);
    String cBMI;
    if (bmi>=28) cBMI="Obese";
    else if (bmi>=23) cBMI="Overweight";
    else if (bmi>=17.5) cBMI="Normal";
    else cBMI="Underweight";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Hasil BMI',
            style: TextStyle(
              fontFamily: 'fantasy',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nama: ${nama}",
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Umur: ${2020 - thn_lahir} Tahun",
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Jenis Kelamin: ${jk}",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Serif',
                fontWeight: FontWeight.w300,
                color: Colors.greenAccent
              ),
            ),
            SizedBox(height: 10,),
            Text(
              cBMI,
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              'Rentang BMI Normal',
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white60,
              ),
            ),
            Text(
              '17,5 - 22.9 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          color: Colors.black54,
          child: Text('Kembali',
            style: TextStyle(
                fontSize: 20
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

    );
  }
}