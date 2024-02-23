class AnnouncementModel {
    final String id;
    final String title;
    final DateTime date;
    final String time;
    final String venue;

    AnnouncementModel({
        required this.id,
        required this.title,
        required this.date,
        required this.time,
        required this.venue,
    });

    factory AnnouncementModel.fromJson(Map<String, dynamic> json) => AnnouncementModel(
        id: json["id"],
        title: json["title"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        venue: json["venue"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "venue": venue,
    };
}
