import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_odev_4/Person.dart';
import 'package:mobil_odev_4/ana_sayfa.dart';
import 'globalVariables.dart';
import 'Person.dart';

class b_d_s extends StatelessWidget {
  const b_d_s({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String isim, soyisim, tel;
    String say = "";
    int? indis;
    final _formKey = GlobalKey<FormState>();
    int sayi = 0;
    TextEditingController textIsim = TextEditingController();
    TextEditingController textSoyisim = TextEditingController();
    TextEditingController textTel = TextEditingController();
    return Scaffold(
    backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("Bul-Düzenle-Sil"),backgroundColor: Colors.purpleAccent
        ),
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
                      controller: textIsim,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'İsim',
                          hintText: 'Melike'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          //return "Bos geçilemez";
                        } else {
                          say = "isim";
                          sayi++;
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
                      controller: textSoyisim,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Soy isim',
                          hintText: 'Cakmak'),
                      validator: (value) {
                        if (value!.isEmpty) {
                        } else {
                          say = "soyisim";
                          sayi++;
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
                      controller: textTel,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefon Numarası',
                          hintText: '5366146388'),
                      validator: (value) {
                        if (value!.isEmpty) {
                        } else {
                          say = "tel";
                          sayi++;
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
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (sayi == 1) {
                                if (say == "isim") {
                                  for (int i = 0; i < persons.length; i++) {
                                    if (persons[i].ad == isim) {
                                      textSoyisim.text = persons[i].soyad;
                                      textTel.text = persons[i].telno;
                                      indis = i;
                                    }
                                  }
                                  ;
                                }
                                if (say == "soyisim") {
                                  for (int i = 0; i < persons.length; i++) {
                                    if (persons[i].soyad == soyisim) {
                                      textIsim.text = persons[i].ad;
                                      textTel.text = persons[i].telno;
                                      indis = i;
                                    }
                                  }
                                  ;
                                }
                                if (say == "tel") {
                                  for (int i = 0; i < persons.length; i++) {
                                    if (persons[i].telno == tel) {
                                      textIsim.text = persons[i].ad;
                                      textSoyisim.text = persons[i].soyad;
                                      indis = i;
                                    }
                                  }
                                  ;
                                }
                                sayi = 0;
                                say = "";
                              } else {

                                textTel.text = "";
                                textSoyisim.text = "";
                                textIsim.text = "";
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text('HATA'),
                                          content: Text(
                                              "Yalnızca bir yere bilgi girilmeli"),
                                          actions: <Widget>[
                                            MaterialButton(
                                                child: Text('Geri Dön'),
                                                onPressed: () =>
                                                    Navigator.pop(context))
                                          ]);
                                    });

                                sayi = 0;
                                say = "";
                              }
                            }
                          },
                          child: const Text(
                            'Bul',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                          onPressed: () {

                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text('ONAY'),
                                      content: Text(
                                          "Düzenlemek istediğinizden emin misiniz?"),
                                      actions: <Widget>[
                                        MaterialButton(
                                            child: Text('Evet'),
                                            onPressed: () {
                                              if (_formKey.currentState!.validate()) {
                                                _formKey.currentState!.save();
                                                persons.removeAt(indis!);
                                                persons.add(Person(isim, soyisim, tel));
                                              }
                                              textTel.text = "";
                                              textSoyisim.text = "";
                                              textIsim.text = "";
                                              Navigator.pop(context);
                                            }
                                        ),
                                        MaterialButton(
                                            child: Text('Hayır'),
                                            onPressed: () =>
                                                Navigator.pop(context))
                                      ]);
                                });





                          },
                          child: const Text(
                            'Düzenle',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text('ONAY'),
                                      content: Text(
                                          "Silmek istediğinizden emin misiniz?"),
                                      actions: <Widget>[
                                        MaterialButton(
                                            child: Text('Evet'),
                                            onPressed: () {
                                              persons.removeAt(indis!);
                                              textTel.text = "";
                                              textSoyisim.text = "";
                                              textIsim.text = "";
                                              Navigator.pop(context);
                                            }
                                        ),
                                        MaterialButton(
                                            child: Text('Hayır'),
                                            onPressed: () =>
                                                Navigator.pop(context))
                                      ]);
                                });


                          },
                          child: const Text(
                            'Sil',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ana_sayfa(yazilacak: uyeAdi)),
                            );
                          },
                          child: const Text(
                            'Anasayfa',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
