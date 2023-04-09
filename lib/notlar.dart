import 'package:flutter/material.dart';
import 'package:mobilprogramlamauyg/anasayfa.dart';
import 'package:mobilprogramlamauyg/ayarlar.dart';
import 'package:mobilprogramlamauyg/borsa.dart';
import 'package:mobilprogramlamauyg/graph.dart';

class Not {
  String baslik;
  String icerik;

  Not({
    required this.baslik,
    required this.icerik,
  });
}

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final List<Not> _not = [];

  final TextEditingController _baslikkontrol = TextEditingController();
  final TextEditingController icerikkontorl = TextEditingController();

  void _addNote() {
    setState(() {
      final not = Not(
        baslik: _baslikkontrol.text,
        icerik: icerikkontorl.text,
      );
      _not.add(not);
      _baslikkontrol.clear();
      icerikkontorl.clear();
    });
  }

  void _deleteNoteAtIndex(int index) {
    setState(() {
      _not.removeAt(index);
    });
  }

  Widget _buildNoteList() {
    return ListView.builder(
      itemCount: _not.length,
      itemBuilder: (context, index) {
        final note = _not[index];
        return Dismissible(
          //surukleme sistemi
          key: Key(note.baslik),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            _deleteNoteAtIndex(index);
          },
          background: Container(
            alignment: Alignment.centerRight,
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          child: ListTile(
            title: Text(note.baslik),
            subtitle: Text(note.icerik),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOT SAYFASI'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          TextField(
            controller: _baslikkontrol,
            decoration: InputDecoration(
              labelText: 'Başlık',
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          TextField(
            controller: icerikkontorl,
            decoration: InputDecoration(
              labelText: 'Not İçeriği',
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _addNote,
            child: Text('Not Ekle'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Notları silmek için notları kaydırın",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(height: 16),
          Expanded(child: _buildNoteList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyNavigatorContainer(
                sayfaAdi: "ANASAYFA",
                yonlendir: anasayfa(),
              ),
              MyNavigatorContainer(
                sayfaAdi: "das",
                yonlendir: graphpage(),
              ),
              MyNavigatorContainer(
                sayfaAdi: "Anasdasdasdasd",
                yonlendir: borsapage(),
              ),
              MyNavigatorContainer(
                sayfaAdi: "Anasdadfgdfdsd",
                yonlendir: ayarlarpage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyNavigatorContainer extends StatelessWidget {
  final String sayfaAdi;
  final Widget yonlendir;

  MyNavigatorContainer({
    this.sayfaAdi = '',
    required this.yonlendir,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => yonlendir),
          );
        },
        child: Text('${sayfaAdi}'),
      ),
    );
  }
}
