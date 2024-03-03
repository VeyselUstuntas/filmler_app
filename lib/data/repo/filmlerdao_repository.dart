import '../entity/filmler.dart';

class FilmlerDaoRepository{
  Future<List<Filmler>> filmleriYukle() async{

    var filmListesi = <Filmler>[];

    var f1 = Filmler(id: 1, ad: "Django", resim: "django.png", fiyat: 24);
    var f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar.png", fiyat: 32);
    var f3 = Filmler(id: 3, ad: "Inception", resim: "inception.png", fiyat: 43);
    var f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight.png", fiyat: 12);
    var f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist.png", fiyat: 29);
    var f6 = Filmler(id: 6, ad: "Anadoluda ", resim: "anadoluda.png", fiyat: 37);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);
    return filmListesi;
  }

}