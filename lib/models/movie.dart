import 'package:flickpicks/models/genero.dart';

class Movie{ //Classe criada
  int id;
  String title;
  String backdropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  num voteAverage;
  double popularity;
  List<Genero> generos;

  Movie({ //Chama a class movie - Toda vez que eu chamar essa class, vou ter que passar todos esses parâmetros.
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.popularity,
    required this.generos,
  });

  factory Movie.fromJson(Map<String, dynamic> json, List<Genero> generos) { //Chamando a class movie, passandos o parâmetros e convertendo de json para objeto.
    return Movie(
    id: json["id"],
    title: json["title"], 
    backdropPath: json["backdrop_path"] ?? "", 
    originalTitle: json["original_title"], 
    overview: json["overview"], 
    posterPath: json["poster_path"], 
    releaseDate: json["release_date"], 
    voteAverage: json["vote_average"],
    popularity: json["popularity"],
    generos: generos,
    );
  }
  
}

// "adult": false,
// "backdrop_path": "/rLb2cwF3Pazuxaj0sRXQ037tGI1.jpg",
// "id": 872585,
// "title": "Oppenheimer",
// "original_language": "en",
// "original_title": "Oppenheimer",
// "overview": "The story of J. Robert Oppenheimer’s role in the development of the atomic bomb during World War II.",
// "poster_path": "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
// "media_type": "movie",
// "genre_ids": [
// 18,
// 36
// ],
// "popularity": 503.208,
// "release_date": "2023-07-19",
// "video": false,
// "vote_average": 8.239,
// "vote_count": 4102