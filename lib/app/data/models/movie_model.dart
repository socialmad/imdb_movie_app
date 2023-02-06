class MovieModel {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? title;
  bool? video;

  MovieModel({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.title,
    this.video,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    title = json['title'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['title'] = title;
    data['video'] = video;
    return data;
  }
}
