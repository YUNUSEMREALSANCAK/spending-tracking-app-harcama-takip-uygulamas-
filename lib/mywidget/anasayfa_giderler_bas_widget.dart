import 'package:flutter/material.dart';

class Giderleri_bas extends StatelessWidget {
  const Giderleri_bas({
    super.key,
    required List<Map<String, dynamic>> giderler,
  }) : _giderler = giderler;

  final List<Map<String, dynamic>> _giderler;

  @override
  Widget build(BuildContext context) {
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
}