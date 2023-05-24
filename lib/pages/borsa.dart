import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/pages/anasayfa.dart';
import 'package:mobilprogramlamauyg/pages/ayarlar.dart';
import 'package:mobilprogramlamauyg/pages/graph.dart';
import 'package:mobilprogramlamauyg/pages/notlar.dart';
import 'package:mobilprogramlamauyg/mywidget/bottom_navigator_witget.dart';

import '../mywidget/borsa_widget.dart';
class borsapage extends StatefulWidget {
  const borsapage({Key? key}) : super(key: key);

  @override
  State<borsapage> createState() => _borsapageState();
}

class _borsapageState extends State<borsapage> {
  @override
  double altin = 1200;
  double dolar = 1200;
  double euro = 1200;
  double gumus = 1200;
  double bitcoin = 1200;
  double ethereum = 1200;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            "BORSA SAYFASI",
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyBorsaWidget(
              birimadi: "altin",
              birimfiyat: altin,
              // icon: Icons.real_estate_agent_sharp,
            ),
            MyBorsaWidget(
              birimadi: "dolar",
              birimfiyat: dolar,
              // icon: Icons.attach_money_outlined,
            ),
            MyBorsaWidget(
              birimadi: "euro",
              birimfiyat: euro,
              // icon: Icons.euro,
            ),
            MyBorsaWidget(
              birimadi: "gümüş",
              birimfiyat: gumus,
              // icon: Icons.shield,
            ),
            MyBorsaWidget(
              birimadi: "bitcoin",
              birimfiyat: bitcoin,
              // icon: Icons.currency_bitcoin_outlined,
            ),
            MyBorsaWidget(
              birimadi: "ethereum",
              birimfiyat: ethereum,
              // icon: Icons.format_shapes_outlined,
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
                  sayfaAdi: "NOTLAR",
                  yonlendir: NotePage(),
                ),
                MyNavigatorContainer(
                  sayfaAdi: "AYARLAR",
                  yonlendir: ayarlarpage(),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}




