import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_odev_4/b_d_s.dart';
import 'package:mobil_odev_4/ekle_sayfa.dart';
import 'package:mobil_odev_4/main.dart';
import 'Listele.dart';
import 'main.dart';


class ana_sayfa extends StatelessWidget {
  final String yazilacak;
  const ana_sayfa({Key? key,required this.yazilacak}) : super(key: key);
  //ana_sayfa(this.yazilacak); //static const String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(title: Text(yazilacak),backgroundColor: Colors.purpleAccent,),
      body: Center(
        child: Container(
          child: Column(
            children: [
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context)=>ekle_sayfa()));
                  },
                  child: const Text(
                    'Ekle',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context)=>b_d_s()));
                  },
                  child: const Text(
                    'Bul-Düzenle-Sil',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
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
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder:
                    //     (context)=>Listele()));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Listele()));
                  },
                  child: const Text(
                    'Listele',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context)=>MyApp()));
                  },
                  child: const Text(
                    'Giriş',
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
