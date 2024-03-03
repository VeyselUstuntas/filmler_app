import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filmler_app/data/entity/filmler_response.dart';

import '../entity/filmler.dart';

class FilmlerDaoRepository{

  List<Filmler> parseFilmler(String response){
    return FilmlerResponse.fromJson(jsonDecode(response)).filmler;
  }

  Future<List<Filmler>> filmleriYukle() async{
    var url = "http://kasimadalan.pe.hu./filmler_yeni/tum_filmler.php";

    var response = await Dio().get(url);

    var filmListesi = parseFilmler(response.data as String);

    return filmListesi;

  }

}