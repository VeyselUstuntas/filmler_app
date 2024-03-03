import 'package:filmler_app/sqlite/veritabani_yardimcisi.dart';

import '../entity/filmler.dart';

class FilmlerDaoRepository{
  Future<List<Filmler>> filmleriYukle() async{
    var db = await VeritabaniYardimcisi.veritabaninaErisim();
    
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Tbl_Filmler");

    return List.generate(maps.length, (index){
      var satir = maps[index];
      return Filmler(id: satir["Id"], ad: satir["film_ad"], resim: satir["film_resim"], fiyat: satir["film_fiyat"]);
    });
  }

}