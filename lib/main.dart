import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/anasayfa.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BÜTÇE TAKİP ',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text("BÜTÇE TAKİP")
          )
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("HOŞGELDİNİZ",style: TextStyle(fontSize: 48,color: Colors.amber ),),
          ),
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 45,
                width: 220,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.blueGrey, width: 2)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => anasayfa()),
                    );
                  },
                  child: Text('ANASAYFA',style:TextStyle(fontSize: 24),),
                ),
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

