class PTVShowsItems {
  List<Results> results = [];

  PTVShowsItems({
    required this.results,
  });

  PTVShowsItems.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(List<Results> results) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  late int id;
  late String name;
  late String overview;
  late String posterPath;

  Results({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    return data;
  }
}
