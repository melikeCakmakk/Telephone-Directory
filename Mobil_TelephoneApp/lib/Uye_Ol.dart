import 'dart:collection';
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:mobil_odev_4/globalVariables.dart';

class Uye_Ol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String uyeadi,kullaniciadi,sifre;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Üye ol"),
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
                      labelText: 'Üye adı',
                      hintText: 'Melike Çakmak'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bos geçilemez";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      uyeadi = value!;
                     },

                ),
              ),
               Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding:EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı adı',
                      hintText: 'Melike'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bos geçilemez";
                      } else {
                        return null;
                      }
                    },
                  onSaved: (value) {
                    kullaniciadi= value!;
                  },


                ),
              ),
               Padding(
                padding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                    sifre = value!;
                  },
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState?.save();
                      kullanici.addAll({kullaniciadi:sifre});
                      uye.addAll({kullaniciadi:uyeadi});
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Kaydol',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


