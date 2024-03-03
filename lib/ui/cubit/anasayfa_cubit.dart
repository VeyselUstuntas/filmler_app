import 'package:filmler_app/data/repo/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/filmler.dart';

class AnasayfaCubit extends Cubit<List<Filmler>>{

  AnasayfaCubit():super(<Filmler>[]);

  var frepo = FilmlerDaoRepository();

  Future<void> filmleriYukle() async{
    var filmListesi = frepo.filmleriYukle();
    emit(await filmListesi);

  }

}