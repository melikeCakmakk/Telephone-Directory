import 'package:flutter/material.dart';
import 'globalVariables.dart';
import 'Person.dart';
import 'dart:math' as math;

class Listele extends StatelessWidget {
  const Listele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("Rehberim"), backgroundColor: Colors.purpleAccent
        ),
        body:Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(persons[index].ad+" "+persons[index].soyad),
                            subtitle: Text(persons[index].telno),
                            leading: Icon(Icons.account_circle_outlined),
                          ),
                        ),

                      ],
                    );
                  }),
            )
          ],
        ) ,

    );
  }
}