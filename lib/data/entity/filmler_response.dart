import 'dart:convert';

import 'filmler.dart';

class FilmlerResponse{

  List<Filmler> filmler ;
  int success;

  FilmlerResponse({required this.filmler, required this.success});

  factory FilmlerResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["filmler"] as List;
    int success = json["success"];

    var filmler = jsonArray.map((jsonArrayNesnesi) => Filmler.fromjson(jsonArrayNesnesi as Map<String,dynamic>)).toList();

    return FilmlerResponse(filmler: filmler, success: success);

  }
}