//TODO: Explicación de los modelos.
//Modelo de movie, se que los modelos eran muy parecidos todos pero decidi crear varios modelos porque
//Para un futuro si llega a cambiar algun modelo esten separados cada uno dependiendo de lo que hace

//Propiedades de nuestro objeto
class Movie {
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

//Metodo fromJson para traernos de un mapa los datos.
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        originalTitle: json['original_title'],
        originalName: json['original_name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        adult: json['adult'],
        originalLanguage: json['original_language'],
        genreIds: json['genre_ids'].cast<int>(),
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

//Por si alguna vez quieres registrar alguna pelicula, lo dejo para fines de la practica
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['backdrop_path'] = backdropPath;
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['original_title'] = originalTitle;
  //   data['overview'] = overview;
  //   data['poster_path'] = posterPath;
  //   data['media_type'] = mediaType;
  //   data['adult'] = adult;
  //   data['original_language'] = originalLanguage;
  //   data['genre_ids'] = genreIds;
  //   data['popularity'] = popularity;
  //   data['release_date'] = releaseDate;
  //   data['video'] = video;
  //   data['vote_average'] = voteAverage;
  //   data['vote_count'] = voteCount;
  //   data['original_name'] = originalName;
  //   return data;
  // }
}
