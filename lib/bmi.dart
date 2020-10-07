import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';
import 'about.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  int thn = 0;

  String _jk="";
  void _pilihJK(String value){
    setState(() {
      _jk = value;
    });
  }

  var _nama = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text('APLIKASI BMI',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: "serif", fontWeight: FontWeight.bold),),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.person,
                  color: Colors.black,
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/about');
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:
                Image.asset('images/img1.jpg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nama,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nama Lengkap!",
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextField(
                      onChanged: (txt){
                        setState(() {
                          thn = int.parse(txt);
                        });
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      decoration: InputDecoration(
                        hintText: "Masukkan Tahhun Lahir!",
                        labelText: "Tahun Lahir",
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                    ),
                    RadioListTile(
                      value: "Pria",
                      groupValue: _jk,
                      title: Text("Pria"),
                      onChanged: (String value){
                        _pilihJK(value);
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 0.0)),
                    RadioListTile(
                      value: "Wanita",
                      groupValue: _jk,
                      title: Text("Wanita"),
                      onChanged: (String value){
                        _pilihJK(value);
                      },
                    )
                  ],
                )
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  // color: Colors.blue[700],
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              tinggi = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              suffix: Text('cm'),
                              filled: true,
                              hintText: 'Tinggi'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              berat = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              suffix: Text('Kg'),
                              filled: true,
                              hintText: 'Berat'),
                        ),
                      ),
                    ],
                  )),

              Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BMIResult(nama : _nama.text, thn_lahir: thn, jk: _jk, tinggi_badan: tinggi, berat_badan: berat)),
                    );
                  },
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.black,
                  // textColor: Colors.white,
                  child: Text(
                    'Hitung BMI',
                    style:
                    TextStyle(fontSize: 18,fontFamily: 'Serif', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: 50,
            color: Colors.redAccent,
            alignment: Alignment.center,
            child: Text(
              'Developed by Arista Devi',
              style: TextStyle(
                  fontFamily: 'fantasy',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
          ),
          //elevation: 0,
        ),
      );
  }
}