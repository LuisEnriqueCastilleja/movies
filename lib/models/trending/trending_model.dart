class Trending {
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

  Trending({
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

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
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

//TODO: VER SI SE USA
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['backdrop_path'] = this.backdropPath;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['original_title'] = this.originalTitle;
  //   data['overview'] = this.overview;
  //   data['poster_path'] = this.posterPath;
  //   data['media_type'] = this.mediaType;
  //   data['adult'] = this.adult;
  //   data['original_language'] = this.originalLanguage;
  //   data['genre_ids'] = this.genreIds;
  //   data['popularity'] = this.popularity;
  //   data['release_date'] = this.releaseDate;
  //   data['video'] = this.video;
  //   data['vote_average'] = this.voteAverage;
  //   data['vote_count'] = this.voteCount;
  //   data['name'] = this.name;
  //   data['original_name'] = this.originalName;
  //   data['first_air_date'] = this.firstAirDate;
  //   data['origin_country'] = this.originCountry;
  //   return data;
  // }
}
