class ButceSil{
  static void butceEksiltme(List<Map<String, dynamic>> giderler, double gidertutari) {
    double tempgider = 0.0;
    for (int i = 0; i < giderler.length; i++) {
      tempgider += giderler[i]["tutar"];
    }
    gidertutari -= tempgider;


  }

}


