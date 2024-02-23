class CareervideosModel {
    final String id;
    final String title;
    final String videos;

    CareervideosModel({
        required this.id,
        required this.title,
        required this.videos,
    });

    factory CareervideosModel.fromJson(Map<String, dynamic> json) => CareervideosModel(
        id: json["id"],
        title: json["title"],
        videos: json["videos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "videos": videos,
    };
}
