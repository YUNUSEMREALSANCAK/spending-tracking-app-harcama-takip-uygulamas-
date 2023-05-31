import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/pages/anasayfa.dart';
import 'package:mobilprogramlamauyg/pages/borsa.dart';
import 'package:mobilprogramlamauyg/pages/graph.dart';
import 'package:mobilprogramlamauyg/pages/notlar.dart';
import 'package:mobilprogramlamauyg/mywidget/bottom_navigator_witget.dart';
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
      backgroundColor: Colors.amber.shade200,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
               color: Colors.amber.shade200,
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
