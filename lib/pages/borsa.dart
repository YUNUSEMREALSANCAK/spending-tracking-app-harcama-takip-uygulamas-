import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/pages/anasayfa.dart';
import 'package:mobilprogramlamauyg/pages/ayarlar.dart';
import 'package:mobilprogramlamauyg/pages/graph.dart';
import 'package:mobilprogramlamauyg/pages/notlar.dart';
import 'package:mobilprogramlamauyg/mywidget/bottom_navigator_witget.dart';
import '../mywidget/borsa_widget.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


Future<borsa> fetchborsa() async {
  final response = await http.get(
    Uri.parse('https://api.collectapi.com/economy/currencyToAll?int=10&base=USD'),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'apikey 4SwgXn1cnH2R1mey0MORya:5skSl7UWcr15NXq3LPhjH2',
    },
  );

  if (response.statusCode == 200) {
    return borsa.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load borsa');
  }
}

class borsa {
  bool? success;
  Result? result;

  borsa({this.success, this.result});

  factory borsa.fromJson(Map<String, dynamic> json) {
    return borsa(
      success: json['success'],
      result: json['result'] != null ? Result.fromJson(json['result']) : null,
    );
  }
}

class Result {
  String? base;
  String? lastupdate;
  List<Data>? data;

  Result({this.base, this.lastupdate, this.data});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      base: json['base'],
      lastupdate: json['lastupdate'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }
}

class Data {
  String? code;
  String? name;
  double? rate;
  String? calculatedstr;
  double? calculated;

  Data({this.code, this.name, this.rate, this.calculatedstr, this.calculated});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      code: json['code'],
      name: json['name'],
      rate: json['rate']?.toDouble(), //
      calculatedstr: json['calculatedstr'],
      calculated: json['calculated']?.toDouble(),
    );
  }
}

class borsapage extends StatefulWidget {
  const borsapage({Key? key}) : super(key: key);

  @override
  State<borsapage> createState() => _borsapageState();
}

class _borsapageState extends State<borsapage> {
  late Future<borsa> futureborsa;

  @override
  void initState() {
    super.initState();
    futureborsa = fetchborsa();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dövizler',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.amber.shade200,
          title: const Text('Dövizler'),
        ),
        body: Column(

          children: <Widget>[
            Expanded(
              child: FutureBuilder<borsa>(
                future: futureborsa,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data?.result?.data;
                    return ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currencyData = data?[index];
                        return ListTile(
                          contentPadding: EdgeInsets.all(12),
                          tileColor: Colors.amber.shade200,
                          title: Text(currencyData?.name ?? ''),
                          subtitle: Text('1 Dolar : ${currencyData?.rate}'),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
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
                  sayfaAdi: "GRAFİK",
                  yonlendir: graphpage(),
                ),
                MyNavigatorContainer(
                  sayfaAdi: "AYARLAR",
                  yonlendir: ayarlarpage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






