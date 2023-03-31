import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/anasayfa.dart';
import 'package:mobilprogramlamauyg/ayarlar.dart';
import 'package:mobilprogramlamauyg/graph.dart';
import 'package:mobilprogramlamauyg/notlar.dart';

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
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 45,
                    width: 620,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.diamond_outlined),
                          Text(
                            'Altın: $altin TL',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 45,
                    width: 620,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.monetization_on_outlined),
                          Text(
                            'Dolar: $dolar TL',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 45,
                    width: 620,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.euro),
                          Text(
                            'Euro: $euro TL',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 45,
                    width: 620,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.shield),
                          Text(
                            'Gümüş: $gumus TL',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 45,
                    width: 620,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.currency_bitcoin_rounded),
                          Text(
                            'Bitcoin: $bitcoin TL',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 45,
                    width: 620,
                    child: Card(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.diamond_outlined),
                          Text(
                            'Ethereum: $ethereum TL',
                          ),
                        ],
                      ),
                    ),
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
                              MaterialPageRoute(builder: (context) => graphpage()),
                            );
                          },
                          child: Text('GRAFİK'),
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
                ),
              ],
            ),
          )),
    );
  }
}
