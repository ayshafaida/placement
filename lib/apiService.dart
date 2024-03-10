import 'dart:convert';
import 'dart:developer';
import 'package:final_project/commonurl.dart';
import 'package:final_project/model/applymodel.dart';
import 'package:final_project/model/profilemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  late Future<List<ApplyModel>> applyjoblist;

  Future<List<ApplyModel>> fetchapplyJobs(String type) async {
    try {
      log("inside the fetchapplyJobs functionmessage");
      final prefs = await SharedPreferences.getInstance();
      String? username = prefs.getString('username');
      log("username======== $username");
      Map data = {
        'username': username,
        'type': type,
      };
      final response = await http.post(
          Uri.parse('${CommonUrl().mainurl}getAppliedjobs.jsp'),
          body: data);

      if (response.statusCode == 200) {
        log("Jobs==== : ${response.body}");
        List res = jsonDecode(response.body);
        return res.map((e) => ApplyModel.fromJson(e)).toList();
      }
    } catch (e) {
      log(" fetchapplyJobs message  :$e");
    }
    return applyjoblist;
  }

  Future<ProfileModel> fetchProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String username = sharedPreferences.getString('username')!;
    log('username:::::::$username');

    final response = await http.post(
        Uri.parse('${CommonUrl().mainurl}getprofile.jsp'),
        body: {"username": username});

    if (response.statusCode == 200) {
      log("statusCode:===${response.statusCode}");
      log("statusbody:===${response.body}");

      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
