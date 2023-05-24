import 'package:flutter/material.dart';


class MyBorsaWidget extends StatelessWidget {
  final String birimadi;
  final double birimfiyat;

  // final icon;

  MyBorsaWidget({
    this.birimadi = '',
    required this.birimfiyat,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              // icon,
              Text(
                '$birimadi,:$birimfiyat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}