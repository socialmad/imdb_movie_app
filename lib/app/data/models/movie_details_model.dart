class MovieDetails {
  String? backdropPath;
  List<Genres>? genres;
  int? id;
  String? imdbId;
  String? originalTitle;
  String? overview;
  String? title;
  bool? video;

  MovieDetails({
    this.backdropPath,
    this.genres,
    this.id,
    this.imdbId,
    this.originalTitle,
    this.overview,
    this.title,
    this.video,
  });

  MovieDetails.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    id = json['id'];
    imdbId = json['imdb_id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    title = json['title'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    if (genres != null) {
      data['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['title'] = title;
    data['video'] = video;

    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
