

class Anasayfa_variable {
  double _butcetutari = 0.0;
  String _gideradi = "";
  double _gidertutari = 0.0;

  Anasayfa_variable({required double butcetutari, required String gideradi, required double gidertutari}) {
    _butcetutari = butcetutari;
    _gideradi = gideradi;
    _gidertutari = gidertutari;
  }

  double get butcetutari => _butcetutari;
  set butcetutari(double value) => _butcetutari = value;

  String get gideradi => _gideradi;
  set gideradi(String value) => _gideradi = value;

  double get gidertutari => _gidertutari;
  set gidertutari(double value) => _gidertutari = value;
}





