
class PosterModel {
    final String id;
    final String poster;
    final String name;

    PosterModel({
        required this.id,
        required this.poster,
        required this.name,
    });

    factory PosterModel.fromJson(Map<String, dynamic> json) => PosterModel(
        id: json["id"],
        poster: json["poster"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "poster": poster,
        "name": name,
    };
}
