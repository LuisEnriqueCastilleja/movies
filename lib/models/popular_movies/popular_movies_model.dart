class PopularMovies {
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

  PopularMovies({
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

  factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
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
