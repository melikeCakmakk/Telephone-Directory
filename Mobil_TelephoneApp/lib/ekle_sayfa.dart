import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_odev_4/Person.dart';
import 'package:mobil_odev_4/ana_sayfa.dart';
import 'package:mobil_odev_4/main.dart';
import 'globalVariables.dart';
import 'Person.dart';
class ekle_sayfa extends StatelessWidget {
  const ekle_sayfa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late String isim,soyisim,tel;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(title: Text("Ekleme"),backgroundColor: Colors.purpleAccent,),
        backgroundColor: Colors.white70,
        body: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                  ),
                   Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'İsim',
                          hintText: 'Melike'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bos geçilemez";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        isim = value!;
                      },
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                  ),
                   Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Soy isim',
                          hintText: 'Cakmak'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bos geçilemez";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        soyisim = value!;
                      },
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefon Numarası',
                          hintText: '5366146388'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bos geçilemez";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        tel = value!;
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                         persons.add(Person(isim,soyisim,tel));
                        for (int i = 0; i < persons.length; i++) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ana_sayfa(yazilacak: uyeAdi)),
                          );
                        }
                      }
                      },
                      child: const Text(
                        'Rehbere Ekle',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
    }
}
