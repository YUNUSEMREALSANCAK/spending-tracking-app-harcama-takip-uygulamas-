import 'package:mobilprogramlamauyg/pages/graph.dart';
import 'package:flutter/material.dart';


class MapFonksiyonlari {
  static void mapeEkle(Map<String, double> dataMap, TextEditingController nameKontrol, TextEditingController degerKontrol) {
    String key = nameKontrol.text;
    double value = double.tryParse(degerKontrol.text) ?? 0.0;

    if (key.isNotEmpty) {
      dataMap[key] = value;
      nameKontrol.clear();
      degerKontrol.clear();
    }
  }

  static void maptenSil(Map<String, double> dataMap, String key) {
    dataMap.remove(key);
  }
}