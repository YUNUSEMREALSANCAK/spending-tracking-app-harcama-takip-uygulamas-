import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(20), color: Color(0xFFFFE082),),
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