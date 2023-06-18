import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/pages/anasayfa.dart';
import 'package:mobilprogramlamauyg/pages/ayarlar.dart';
import 'package:mobilprogramlamauyg/pages/borsa.dart';
import 'package:mobilprogramlamauyg/pages/notlar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:mobilprogramlamauyg/mywidget/bottom_navigator_witget.dart';
import 'package:mobilprogramlamauyg/functions/graphfunc/graph_sil.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class graphpage extends StatefulWidget {
  const graphpage({Key? key}) : super(key: key);

  @override
  State<graphpage> createState() => _graphpageState();
}

class _graphpageState extends State<graphpage> {
  Map<String, double> dataMap = {};



  TextEditingController _nameKontrol = TextEditingController();
  TextEditingController _degerKontrol = TextEditingController();

  void _mapeEkle() {
    MapFonksiyonlari.mapeEkle(dataMap, _nameKontrol, _degerKontrol);


    setState(() {});

  }

  void _maptenSil(String key) {
    MapFonksiyonlari.maptenSil(dataMap, key);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.amber,
          title: Center(child: Text("GRAFİK SAYFASI")
          )
      ),
      backgroundColor: Colors.amber.shade200,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameKontrol,
              decoration: InputDecoration(
                hintText: 'GİDER İSMİ ',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _degerKontrol,
              decoration: InputDecoration(
                hintText: 'GİDER TUTARI',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _mapeEkle,
            child: Text('GİDER EKLE'),
          ),
          Expanded(
            child: dataMap.isNotEmpty
                ? PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 1200),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              chartType: ChartType.disc,
              initialAngleInDegree: 0,
              ringStrokeWidth: 32,
              centerText: "GİDERLER",
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
              ),
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              colorList: [
                Colors.amber.shade400,
                Colors.purple.shade400,
                Colors.blue.shade400,
                Colors.yellow.shade400,
                Colors.orange.shade400,
                Colors.purple.shade400,
                Colors.pink.shade400,
              ],
            )
                : Center(
              child: Text('HENÜZ VERİ GİRİLMEDİ'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataMap.length,
              itemBuilder: (BuildContext context, int index) {
                String key = dataMap.keys.elementAt(index);
                double value = dataMap[key]!;
                return ListTile(
                  title: Text(key),
                  subtitle: Text(value.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _maptenSil(key),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyNavigatorContainer(
                sayfaAdi: "ANASAYFA",
                yonlendir: anasayfa(),
              ),
              MyNavigatorContainer(
                sayfaAdi: "NOTLAR",
                yonlendir: NotePage(),
              ),
              MyNavigatorContainer(
                sayfaAdi: "BORSA",
                yonlendir: borsapage(),
              ),
              MyNavigatorContainer(
                sayfaAdi: "AYARLAR",
                yonlendir: ayarlarpage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
