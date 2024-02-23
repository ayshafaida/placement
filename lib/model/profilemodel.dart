class ProfileModel {
    final String id;
    final String name;
    final String address;
    final String gender;
    final String department;
    final String profileImage;
    final String mobile;
    final String email;

    ProfileModel({
        required this.id,
        required this.name,
        required this.address,
        required this.gender,
        required this.department,
        required this.profileImage,
        required this.mobile,
        required this.email,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        gender: json["gender"],
        department: json["department"],
        profileImage: json["profile_image"],
        mobile: json["mobile"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "gender": gender,
        "department": department,
        "profile_image": profileImage,
        "mobile": mobile,
        "email": email,
    };
}
