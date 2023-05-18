import 'package:flutter/material.dart';


class ButceSil{

  static void butceEklemeSayfasi(BuildContext context, double butcetutari, Function(double) updateBudget) {
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
                  updateBudget(double.tryParse(value) ?? 0.0);
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




}