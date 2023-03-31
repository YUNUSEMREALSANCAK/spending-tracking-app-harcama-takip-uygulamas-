import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/anasayfa.dart';
import 'package:mobilprogramlamauyg/ayarlar.dart';
import 'package:mobilprogramlamauyg/borsa.dart';
import 'package:mobilprogramlamauyg/notlar.dart';
import 'package:pie_chart/pie_chart.dart';

class graphpage extends StatefulWidget {
  const graphpage({Key? key}) : super(key: key);

  @override
  State<graphpage> createState() => _graphpageState();
}

class _graphpageState extends State<graphpage> {
  Map<String, double> dataMap = {};

  TextEditingController nameKontrol = TextEditingController();
  TextEditingController _degerKontrol = TextEditingController();

  void _mapeEkle() {
    String key = nameKontrol.text;
    double value = double.tryParse(_degerKontrol.text) ?? 0.0;

    if (key.isNotEmpty) {
      setState(() {
        dataMap[key] = value;
      });
      nameKontrol.clear();
      _degerKontrol.clear();
    }
  }

  void _maptenSil(String key) {
    setState(() {
      dataMap.remove(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text("GRAFİK SAYFASI")
          )
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameKontrol,
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
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        MaterialPageRoute(builder: (context) => ayarlarpage()),
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
                        MaterialPageRoute(builder: (context) => NotePage()),
                      );
                    },
                    child: Text('NOTLAR'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
