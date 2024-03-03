import 'package:filmler_app/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/filmler.dart';
import 'detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().filmleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filmler"),),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
          builder: (context, filmListesi) {
            if(filmListesi.isNotEmpty){
              return GridView.builder(
                  itemCount: filmListesi.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //bu bir satırda kaç tane veri gösterceğimizin belirtir.
                      childAspectRatio: 1/1.8) ,
                  itemBuilder: (context, indeks){
                    var film = filmListesi[indeks];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film)))
                            .then((value) {
                          print("Detay Sayfassından filmler sayfasına dönüldü.");
                        });
                      },
                      child: Card(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network("http://kasimadalan.pe.hu./filmler_yeni/resimler/${film.resim}"),
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${film.fiyat} ₺", style: TextStyle(fontSize: 24),),
                                  ElevatedButton(
                                      onPressed: (){
                                        print("${film.ad} filmi sepete eklendi.");
                                      },
                                      child: Text("Sepet"))
                                ],
                              ),
                            ),
                          ],
                        ),),
                    );
                  });
            }
            else{
              return const Center();
            }
          },),
    );
  }
}
