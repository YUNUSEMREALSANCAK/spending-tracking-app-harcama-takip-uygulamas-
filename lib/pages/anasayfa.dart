import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/pages/ayarlar.dart';
import 'package:mobilprogramlamauyg/pages/borsa.dart';
import 'package:mobilprogramlamauyg/pages/graph.dart';
import 'package:mobilprogramlamauyg/pages/notlar.dart';
import 'package:mobilprogramlamauyg/mywidget/bottom_navigator_witget.dart';
import 'package:mobilprogramlamauyg/variable/anasayfa_variable.dart';
class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  double _butcetutari = 0.0;
  String _gideradi = "";
  double _gidertutari = 0.0;
  List<Map<String, dynamic>> _giderler = [];

  void butceeksiltme() {
    double tempgider = 0.0;
    for (int i = 0; i < _giderler.length; i++) {
      tempgider += _giderler[i]["tutar"];
    }
    _gidertutari -= tempgider;
  }

  void butceeklemesayfasi() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Bütçe Ekle"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Bütçe Miktarı",
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    _butcetutari = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ekle"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _gidereklemesayfasi() {
    bool expenseAdded = false;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Harcama Ekle"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Harcama Adı",
                ),
                onChanged: (value) {
                  setState(() {
                    _gideradi = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Harcama Miktarı",
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    _gidertutari = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ekle"),
              onPressed: () {
                _giderler.add({
                  "isim": _gideradi,
                  "tutar": _gidertutari,
                });
                butceeksiltme();
                expenseAdded = true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((_) {
      if (expenseAdded) {
        setState(() {});
      }
    });
  }

  Widget _giderleribas() {
    return Expanded(
      child: ListView.builder(
        itemCount: _giderler.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            // shape: Border.all(style:),
            color: Colors.amber,
            child: ListTile(
              title: Text(_giderler[index]["isim"]),
              subtitle: Text("${_giderler[index]["tutar"]} TL"),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text("GİDER TAKİP SAYFASI")
          )
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bütçe: $_butcetutari TL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  tooltip: 'BÜTÇE EKLE',
                  backgroundColor: Colors.amber,
                  splashColor: Colors.blueGrey,
                  onPressed: butceeklemesayfasi,
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          _giderleribas(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyNavigatorContainer(
                sayfaAdi: "NOTLAR",
                yonlendir: NotePage(),
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
                sayfaAdi: "AYARLAR",
                yonlendir: ayarlarpage(),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30,top: 30,right: 2,bottom: 60),
        child: FloatingActionButton(
          tooltip: 'GİDER EKLE',
          backgroundColor: Colors.amber,
          splashColor: Colors.blueGrey,
          onPressed: _gidereklemesayfasi,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
