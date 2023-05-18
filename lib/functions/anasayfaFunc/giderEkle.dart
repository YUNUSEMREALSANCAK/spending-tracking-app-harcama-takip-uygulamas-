import 'package:flutter/material.dart';


class GiderEkle {

  static void giderEklemeSayfasi(BuildContext context,
      List<Map<String, dynamic>> giderler, Function() updateState) {
    String gideradi = "";
    double gidertutari = 0.0;
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
                  gideradi = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Harcama Miktarı",
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  gidertutari = double.tryParse(value) ?? 0.0;
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
                giderler.add({
                  "isim": gideradi,
                  "tutar": gidertutari,
                });
                 // butceEksiltme(giderler, gidertutari);
                expenseAdded = true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((_) {
      if (expenseAdded) {
        updateState();
      }
    });
  }



}