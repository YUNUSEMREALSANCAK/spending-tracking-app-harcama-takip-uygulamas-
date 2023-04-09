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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyNavigatorContainer(
              sayfaAdi: "ANASAYFA",
              yonlendir: anasayfa(),
            ),
            MyNavigatorContainer(
              sayfaAdi: "GRAFİK",
              yonlendir: graphpage(),
            ),
            MyNavigatorContainer(
              sayfaAdi: "BORSA",
              yonlendir: borsapage(),
            ),
            MyNavigatorContainer(
              sayfaAdi: "NOTLAR",
              yonlendir: NotePage(),
            ),
          ],
        ),
      ]),
    );
  }
}
class MyNavigatorContainer extends StatelessWidget {

  final String sayfaAdi;
  final Widget yonlendir;

  MyNavigatorContainer({this.sayfaAdi = '', required this.yonlendir,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => yonlendir),
          );
        },
        child: Text('${sayfaAdi}'),
      ),
    );
  }
}