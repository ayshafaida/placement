// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


class DepartmentModel {
    final String id;
    final String department;

    DepartmentModel({
        required this.id,
        required this.department,
    });

    factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
        id: json["id"],
        department: json["department"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "department": department,
    };
}
