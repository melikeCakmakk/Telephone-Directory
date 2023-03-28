import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mobil_odev_4/ana_sayfa.dart';
import 'package:mobil_odev_4/globalVariables.dart';
import 'Uye_Ol.dart';


void main() {

  kullanici.addAll({'admin':'admin'});
  uye.addAll({"admin":"Melike"});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  late String username,pass;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Giriş Yap",),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),

              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı adı',
                      hintText: 'Melike Nur'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Bos geçilemez!";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    username = value!;
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                      hintText: 'Şifre giriniz'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Bos geçilemez";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    pass = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style:  ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      if (kullanici.containsKey(username)) {
                         String? gec  = kullanici[username];
                         print(gec);
                         String? passw = kullanici[gec];
                         print(passw);
                         if(pass == gec){
                           uyeAdi= uye[username]!;
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ana_sayfa(yazilacak: uyeAdi,)),
                           );
                         }
                         else{
                           showDialog(
                               barrierDismissible: false,
                               context: context, builder:(BuildContext context)
                           {
                             return AlertDialog(
                                 title: Text('HATA'),
                                 content: Text('Şifre yanlış tekrar deneyin'),
                                 actions: <Widget>[
                                   MaterialButton(child : Text('Geri Dön'),onPressed:()=>Navigator.pop(context))
                                 ]
                             );
                           });

                         }

                      }
                      else{
                        showDialog(
                            barrierDismissible: false,
                            context: context, builder:(BuildContext context)
                        {
                          return AlertDialog(
                              title: Text('HATA'),
                              content: Text('Böyle bir kullanıcı yok'),
                              actions: <Widget>[
                                MaterialButton(child : Text('Geri Dön'),onPressed:()=>Navigator.pop(context))
                              ]
                          );
                        });
                      }
                    }
                  },
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Uye_Ol()),
                  );
                },

                child: const Text(
                  'Üye ol',
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 25),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

Dialog leadDialog = Dialog(
  child: Container(
    height: 300.0,
    width: 360.0,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Choose from Library',
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          ),
        ),
      ],
    ),
  ),
);
