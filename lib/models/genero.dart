class Genero {
  //Classe criada
  String name;
  int id;

  Genero({
    //Chama a class movie - Toda vez que eu chamar essa class, vou ter que passar todos esses parâmetros.
    required this.id,
    required this.name,
  });

  factory Genero.fromJson(Map<String, dynamic> json) {
    //Chamando a class movie, passandos o parâmetros e convertendo de json para objeto.
    return Genero(
      id: json["id"],
      name: json["name"],
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