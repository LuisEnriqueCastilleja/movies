class MoviesDates {
  String? maximum;
  String? minimum;

  MoviesDates({this.maximum, this.minimum});

  factory MoviesDates.fromJson(Map<String, dynamic> json) => MoviesDates(
        maximum: json['maximum'],
        minimum: json['minimum'],
      );
}
