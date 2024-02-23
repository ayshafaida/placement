class PlacementCellModel {
    final String id;
    final String name;
    final String image;
    final String mobile;

    PlacementCellModel({
        required this.id,
        required this.name,
        required this.image,
        required this.mobile,
    });

    factory PlacementCellModel.fromJson(Map<String, dynamic> json) => PlacementCellModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "mobile": mobile,
    };
}
