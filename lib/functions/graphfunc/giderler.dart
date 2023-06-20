import 'package:cloud_firestore/cloud_firestore.dart';

class gider {
  String id;
  String giderismi;
  double gidertutar;

  gider({required this.id, required this.giderismi, required this.gidertutar});

  factory gider.fromSnapshot(DocumentSnapshot snapshot) {
    return gider(
      id: snapshot.id,
      giderismi: snapshot["giderismi"],
      gidertutar: snapshot["gidertutar"],
    );
  }
}