import 'dart:convert';

import 'package:flickpicks/constants.dart';
import 'package:flickpicks/models/genero.dart';
import 'package:flickpicks/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _genresUrl =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.apiKey}&language=pt-br';
  Future<List<Movie>> getTregindMovies(List<Genero> generos, String generosSelect,) async {
    String _trendingUrl = 'https://api.themoviedb.org/3/discover/movie?&include_adult=false&with_genres=${generosSelect}&include_video=false&language=pt-br&page=1&sort_by=popularity.desc&api_key=${Constants.apiKey}';
    //String _detalhesMovie = 'https://api.themoviedb.org/3/movie/${movideId}?api_key=${Constants.apiKey}';

    final response = await http.get(Uri.parse(_trendingUrl)); // conexão
    if (response.statusCode == 200) {
      //verifica se está funcionando
      final decodeData = json.decode(response.body)['results']
          as List; //Retorna o "corpo" da API, que seria uma string.
      print(decodeData);
      return decodeData.map((movie) {
        List<Genero> generosFilme = [];
        for (var i = 0; i < generos.length; i++) {
          // ignore: iterable_contains_unrelated_type
          if (movie["genre_ids"].contains(generos[i].id)) {
            generosFilme.add(generos[i]);
          }
        }
        return Movie.fromJson(movie, generosFilme);
      }).toList();

      //Basicamente pega todos os dados que a API retorna e converte no objeto movie, depois passa para um vetor.
    } else {
      throw Exception('Espera ai');
    }
  }

  Future<List<Genero>> getGenerosMovies() async {
    final response = await http.get(Uri.parse(_genresUrl)); // conexão
    if (response.statusCode == 200) {
      //verifica se está funcionando
      print(response.body);
      final decodeData = json.decode(response.body)['genres']
          as List; //Retorna o "corpo" da API, que seria uma string.
      return decodeData
          .map((genero) => Genero.fromJson(genero))
          .toList(); //Basicamente pega todos os dados que a API retorna e converte no objeto movie, depois passa para um vetor.
    } else {
      throw Exception('Espera ai');
    }
  }

  
}
