import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/anasayfa.dart';
import 'package:mobilprogramlamauyg/borsa.dart';
import 'package:mobilprogramlamauyg/graph.dart';
import 'package:mobilprogramlamauyg/notlar.dart';

class ayarlarpage extends StatelessWidget {
  const ayarlarpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            "AYARLAR SAYFASI",
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
              color: Colors.amber,
              margin: EdgeInsets.all(30),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                    "BEN SENİN İÇİN HER ŞEYİ AYARLADIM BURADA DURMANA GEREK YOK :D",
                    style: TextStyle(fontSize: 24)),
              )),
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.amber),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => anasayfa()),
                    );
                  },
                  child: Text('ANASAYFA'),
                ),
              ),
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.amber),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => borsapage()),
                    );
                  },
                  child: Text('BORSA VERİLERİ'),
                ),
              ),
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.amber),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotePage()),
                    );
                  },
                  child: Text('AYARLAR'),
                ),
              ),
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.amber),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => graphpage()),
                    );
                  },
                  child: Text('GIRAFİK'),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
