import 'package:movies/models/actors/know_for_model.dart';

class Actor {
  int? id;
  String? name;
  String? originalName;
  String? mediaType;
  bool? adult;
  double? popularity;
  int? gender;
  String? knownForDepartment;
  String? profilePath;
  List<KnownFor>? knownFor;

  Actor(
      {this.id,
      this.name,
      this.originalName,
      this.mediaType,
      this.adult,
      this.popularity,
      this.gender,
      this.knownForDepartment,
      this.profilePath,
      this.knownFor});

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json['id'],
        name: json['name'],
        originalName: json['original_name'],
        mediaType: json['media_type'],
        adult: json['adult'],
        popularity: json['popularity'],
        gender: json['gender'],
        knownForDepartment: json['known_for_department'],
        profilePath: json['profile_path'],
        knownFor: json["known_for"] != null
            ? List<KnownFor>.from(
                json["known_for"].map((x) => KnownFor.fromJson(x)))
            : null,
      );
}
